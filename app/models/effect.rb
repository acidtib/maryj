# == Schema Information
#
# Table name: effects
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Effect < ActiveRecord::Base
  belongs_to :strain
  has_many :effect_items
  has_many :strains, :through => :effect_items
end
