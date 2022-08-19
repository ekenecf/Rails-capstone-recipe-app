class RecipeFoodsController < ApplicationController # rubocop:todo Style/Documentation
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @recipe_foods = RecipeFood.includes(:user).where(user: @user.id)
  end

  def new
    @recipe_food = RecipeFood.new # same as current_user.recipe_food.build
  end

  def create # rubocop:todo Metrics/MethodLength, Metrics/AbcSize
    recipe = Recipe.find(params[:recipe_id])
    food = Food.where(user_id: current_user.id)
    created_recipe_food = RecipeFood.new(recipe_food_method)
    created_recipe_food.recipe_id = recipe.id
    created_recipe_food.food_id = food[0].id

    if created_recipe_food.save
      flash[:notice] = 'recipe_food created successfully.'
      redirect_to user_recipe_path(food[0].user, recipe)
    else
      flash[:error] = 'recipe_food creation unsucessful!'
      @recipe_food = created_recipe_food
      render :new
    end
  end

  private

  def recipe_food_method
    params.require(:recipe_food).permit(:quantity)
  end
end
