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

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = User.find(params[:user_id])
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to user_recipes_path(params[:user_id]), notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to user_recipes_path(params[:user_id]), notice: 'Recipe was successfully destroyed.' }
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end

# before_action :set_recipe, only: %i[show edit update destroy]
