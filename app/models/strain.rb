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

  has_many :condition_items
  has_many :conditions, :through => :condition_items

  has_many :effect_items
  has_many :effects, :through => :effect_items

  has_many :flavor_items
  has_many :flavors, :through => :flavor_items

  has_many :symptom_items
  has_many :symptoms, :through => :symptom_items

  #before_create :generate_slug


  private

    def generate_slug
      self.slug = self.name.parameterize
    end
end
