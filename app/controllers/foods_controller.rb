class FoodsController < ApplicationController
  def index
    @foods = Food.all
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

end
