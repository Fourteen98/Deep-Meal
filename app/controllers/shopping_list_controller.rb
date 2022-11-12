class ShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.includes([:food])
    @total_value = 0
    @total_ingredients = @recipe_foods.all.where(recipe_id: @recipe).count
    @missing_foods = []
    @recipe_foods.each do |ingredient|
      @total_value += ingredient.quantity * ingredient.food.price
      # @total_ingredients += 1
      @missing_foods << ingredient
    end

  end
end
