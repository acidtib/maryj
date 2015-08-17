# == Schema Information
#
# Table name: strains
#
#  id          :integer          not null, primary key
#  slug        :string
#  name        :string
#  symbol      :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Strain < ActiveRecord::Base
  has_one :category
end
