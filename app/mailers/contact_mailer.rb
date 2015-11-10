class ContactMailer < ApplicationMailer
	default from: 'notifications@contactbooker.com'

	def share_contact(contact, email)
		@contact = contact
		@url = contact_url(contact)
		mail(to: email, subject: "#{@contact.full_name}'s Contact Info" )
	end

end
