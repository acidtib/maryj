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

class ConditionItem < ActiveRecord::Base
  belongs_to :strain
  belongs_to :condition
end
