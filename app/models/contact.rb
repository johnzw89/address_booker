# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ActiveRecord::Base

	validates :first_name, :last_name, presence: true
	validates_uniqueness_of :first_name, scope: [:last_name]

	has_many :contact_methods
	accepts_nested_attributes_for :contact_methods, allow_destroy: true

	def full_name
		first_name + " " + last_name
	end
end
