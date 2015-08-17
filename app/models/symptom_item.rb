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

class SymptomItem < ActiveRecord::Base
  belongs_to :strain
  belongs_to :symptom
end
