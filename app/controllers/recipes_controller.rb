# frozen_string_literal: true

class RecipesController < ApplicationController # rubocop:todo Style/Documentation
  def index
    @user = User.find(params[:user_id])
    @recipes = Recipe.includes(:user).where(user: @user.id)
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.includes(:user).find(params[:id])
    @recipe_foods = RecipeFood.includes(:food, :recipe).where(recipe_id: params[:id])
  end

  def create # rubocop:todo Metrics/MethodLength
    user = User.find(params[:user_id])
    created_recipe = Recipe.new(recipe_params)
    created_recipe.user_id = user.id

    if created_recipe.save
      flash[:notice] = 'Recipe created successfully.'
      redirect_to user_recipes_path(user, created_recipe)
    else
      flash[:error] = 'Recipe creation unsucessful!'
      @recipe = created_recipe
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to user_recipes_path(@recipe.user, @recipe), notice: "Successfully deleted #{@recipe.name}."
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
