# == Schema Information
#
# Table name: condition_items
#
#  id           :integer          not null, primary key
#  strain_id    :integer
#  condition_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ConditionItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
