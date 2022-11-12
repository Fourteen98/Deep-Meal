class RecipeFoodsController < ApplicationController
  def index
  end

  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_id]
    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to user_recipe_path(params[:user_id], @recipe_food.recipe_id), notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @recipe_food = RecipeFood.find_by(id: params[:id])
    @recipe_food.destroy
    respond_to do |format|
      format.html { redirect_to user_recipe_path(params[:user_id]), notice: 'Recipe Ingredient was successfully destroyed.' }
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
