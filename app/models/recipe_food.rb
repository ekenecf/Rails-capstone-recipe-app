class RecipeFood < ApplicationRecord
  belongs_to :recipe, foreign_key: 'recipe_id'
  belongs_to :food, foreign_key: 'food_id'

  validates :food, presence: true
  validates :recipe, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
