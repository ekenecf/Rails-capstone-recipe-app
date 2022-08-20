# frozen_string_literal: true

# rubocop:todo Lint/MissingCopEnableDirective
# rubocop:disable Style/Documentation
# rubocop:enable Lint/MissingCopEnableDirective

class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
  end
end
