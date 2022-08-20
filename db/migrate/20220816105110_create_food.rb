# frozen_string_literal: true

class CreateFood < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.float :price
      t.bigint :quantity
      t.references :user, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
