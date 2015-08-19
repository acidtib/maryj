# == Schema Information
#
# Table name: symptoms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Symptom < ActiveRecord::Base
  belongs_to :strain
  has_many :symptom_items
  has_many :strains, :through => :symptom_items
end
