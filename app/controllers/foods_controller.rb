class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @foods = Food.all
    @user = User.find(params[:user_id])
  end

  def destroy
    @food = Food.find_by(id: params[:id])
    @food.destroy
    respond_to do |format|
      format.html { redirect_to user_foods_path(params[:user_id]), notice: 'Food was successfully destroyed.' }
    end
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = User.find(params[:user_id])
    respond_to do |format|
      if @food.save
        format.html { redirect_to user_foods_path(params[:user_id]), notice: 'Food was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
