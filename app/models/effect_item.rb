# == Schema Information
#
# Table name: effect_items
#
#  id         :integer          not null, primary key
#  strain_id  :integer
#  effect_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EffectItem < ActiveRecord::Base
  belongs_to :strain
  belongs_to :effect
end
