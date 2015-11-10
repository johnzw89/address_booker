# == Schema Information
#
# Table name: phone_numbers
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  digits     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
