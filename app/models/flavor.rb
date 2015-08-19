# == Schema Information
#
# Table name: flavors
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Flavor < ActiveRecord::Base
  belongs_to :strain
  has_many :flavor_items
  has_many :strains, :through => :flavor_items
end
