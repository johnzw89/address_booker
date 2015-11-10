# == Schema Information
#
# Table name: contact_methods
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  info       :string
#  info_type  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactMethod < ActiveRecord::Base
	belongs_to :contact
	validates :info, :info_type, presence: true

	TYPES = { email: "email", phone: "phone" }
end
