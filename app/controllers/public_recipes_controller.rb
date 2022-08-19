class PublicRecipesController < ApplicationController
  # rubocop:enable Style/Documentation
  def index # rubocop:todo Metrics/AbcSize, Metrics/MethodLength
      # rubocop:todo Layout/IndentationWidth
      @recipes = Recipe.includes(:user).where(public: true).order(created_at: :desc)
      # rubocop:enable Layout/IndentationWidth
      @public_recipes = []

      unless @recipes.empty? # rubocop:todo Style/GuardClause

      @recipes.each do |recipe| # rubocop:todo Layout/IndentationWidth
        recipe_food = RecipeFood.where(recipe_id: recipe.id)
        next if recipe_food.empty?

        food_items = recipe_food[0].quantity
        food = Food.find(recipe_food[0].food_id)

        user = User.find(food.user_id)
        total_price = food.price * food_items
        public_recipe = {
          id: recipe.id,
          recipe_name: recipe.name,
          user:,
          food_items:,
          total_price:
        }
        @public_recipes << public_recipe
      end
      end
  end
end
