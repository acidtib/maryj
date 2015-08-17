# == Schema Information
#
# Table name: symptom_items
#
#  id         :integer          not null, primary key
#  strain_id  :integer
#  symptom_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SymptomItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
