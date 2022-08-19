class FoodsController < ApplicationController # rubocop:todo Style/Documentation
  load_and_authorize_resource

  # GET /foods
  def index
    @user = User.find(params[:user_id])
    @foods = Food.includes(:user).where(user: @user.id)
  end

  # GET /new
  def new
    @food = Food.new # same as current_user.posts.build
  end

  # POST /foods
  def create # rubocop:todo Metrics/MethodLength
    user = User.find(params[:user_id])
    created_food = Food.new(food_params)
    created_food.user_id = user.id

    if created_food.save
      flash[:notice] = 'food created successfully.'
      redirect_to user_foods_path(user, created_food)
    else
      flash[:error] = 'food create unsucessful!'
      @food = created_food
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to user_foods_path(@food.user, @food), notice: "Successfully deleted #{@food.name}."
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
