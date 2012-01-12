# == Schema Information
#
# Table name: user_competences
#
#  id            :integer         not null, primary key
#  user_id       :integer
#  competence_id :integer
#  level         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class UserCompetenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
