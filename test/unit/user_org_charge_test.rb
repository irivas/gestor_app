# == Schema Information
#
# Table name: user_org_charges
#
#  id              :integer         not null, primary key
#  user_id         :integer
#  organic_unit_id :integer
#  charge_id       :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class UserOrgChargeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
