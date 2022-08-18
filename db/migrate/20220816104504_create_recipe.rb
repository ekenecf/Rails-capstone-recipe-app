# frozen_string_literal: true

class CreateRecipe < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    create_table :recipes do |t|
      t.string :name
      t.float :preparation_time
      t.float :cooking_time
      t.text :description
      t.boolean :public
      t.references :user, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
