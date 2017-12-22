class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  def ingredient_attributes=(ing)
    self.ing = Ingredient.find_or_create_by(name: ing.name)
    self.ing.update(ing)
  end
end
