class RecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @recipes = Recipe.all
  end

  def show
  end
end
