# frozen_string_literal: true

# rubocop:todo Style/Documentation

class GeneralShoppingListsController < ApplicationController # rubocop:todo Style/Documentation
  # rubocop:enable Style/Documentation
  def index # rubocop:todo Metrics/AbcSize, Metrics/MethodLength
      @recipe_foods_lists = [] # rubocop:todo Layout/IndentationWidth
      @total_food_price = 0
      @total_food_item = 0
      @recipes = current_user.recipes
      @recipes.includes(:recipe_foods).each do |recipe|
          @total_food_item += recipe.recipe_foods.count # rubocop:todo Layout/IndentationWidth
          @recipe_foods_lists << recipe.recipe_foods

          recipe.recipe_foods.includes(:food).each do |recipe_food|
              # rubocop:todo Layout/IndentationWidth
              @total_food_price = recipe_food.food.quantity * recipe_food.food.price
            # rubocop:enable Layout/IndentationWidth
          end
      end
  end
end
