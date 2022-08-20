# frozen_string_literal: true

class CreateRecipeFood < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    create_table :recipe_foods do |t|
      t.bigint :quantity
      t.references :recipe, foreign_key: { to_table: 'recipes' }
      t.references :food, foreign_key: { to_table: 'foods' }

      t.timestamps
    end
  end
end
