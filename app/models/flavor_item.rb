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

class FlavorItem < ActiveRecord::Base
  belongs_to :strain
  belongs_to :flavor
end
