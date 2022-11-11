class RecipesController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery except: [:toggle]
  def index
    @user = User.find(params[:user_id])
    @recipes = Recipe.all
  end

  def show
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])
  end

  def toggle
    @recipe = Recipe.find(params[:id])
    @recipe.toggle!(:public)
  end

  # private
  #
  # def recipe_params
  #   params.require(:recipe).permit(:public)
  # end
end

# before_action :set_recipe, only: %i[show edit update destroy]
