# == Schema Information
#
# Table name: flavor_items
#
#  id         :integer          not null, primary key
#  strain_id  :integer
#  flavor_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FlavorItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
