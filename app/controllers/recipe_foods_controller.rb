class RecipeFoodsController < ApplicationController
  def index; end

  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_id]
    respond_to do |format|
      if @recipe_food.save
        format.html do
          redirect_to user_recipe_path(params[:user_id], @recipe_food.recipe_id),
                      notice: 'Recipe was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food = RecipeFood.find_by(id: params[:id])
    @recipe_food.destroy
    respond_to do |format|
      format.html do
        redirect_to user_recipe_path(params[:user_id]), notice: 'Recipe Ingredient was successfully destroyed.'
      end
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])  
    p 'i was in edit for recipe_food'
    p @recipe_food
  end

  def update
    p 'i was in update for recipe_food'
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(recipe_food_params)
      p recipe_food_params
      format.html do
        redirect_to user_recipe_path(params[:user_id], params[:id]), notice: 'Recipe was successfully created.'
      end
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
