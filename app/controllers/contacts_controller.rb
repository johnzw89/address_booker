class ContactsController < ApplicationController

	require 'csv'

	def index
		@contacts = Contact.all

	end

	def show
		@contact = Contact.find(params[:id])
	end

	def new
		@contact = Contact.new
		@contact.contact_methods.build
	end

	def add_contact_method
		@contact_method = ContactMethod.new
		respond_to do |format|
    	format.js
  	end
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def update
		@contact = Contact.find(params[:id])
		params[:contact][:contact_methods_attributes].each do |key, value|
			cm = ContactMethod.where(id: value["id"]).first_or_initialize
			cm.info = value["info"]
			cm.info_type = value["info_type"]
			cm.save!
		end

		redirect_to @contact
	end

	def destroy
		@contact = Contact.find(params[:id])
		if @contact.destroy
			redirect_to root_url
		else

		end
	end


	def upload_csv
		file  = params[:csv_file]
		# parse and create records
		if file
			row_number = 0
			CSV.foreach(file.path) do |row|
				# sample format:
				# ["john", "Wei", "johnzw89@gmail.com", "917 488 3195"]
				row_number += 1
				if row_number > 1
					# begin
						contact = Contact.find_or_create_by(first_name: row[0], last_name: row[1] )
						# create emails and phone numbers
						contact.contact_methods.find_or_create_by(info: row[2], info_type: ContactMethod::TYPES[:email])
						contact.contact_methods.find_or_create_by(info: row[3], info_type: ContactMethod::TYPES[:phone])

					# rescue
					# 	next
					# end

				end
			end
		end
		redirect_to :contacts
	end

	def download_csv
		@contacts = Contact.all
		csv_file = CSV.generate do |csv|
      csv << ["first name", "last name", "Contact Info", "Contact Type"]
      @contacts.each do |c|
      	c.contact_methods.each do |cm|
      		row = [c.first_name, c.last_name, cm.info, cm.info_type]
        	csv << row
      	end
      end
    end

    respond_to do |format|
    	format.csv do
      	send_data csv_file
      end
    end
    
    
    
	end

end
