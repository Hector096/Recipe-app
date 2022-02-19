class RecipesController < ApplicationController
  load_and_authorize_resource expect: :public_recipes
  skip_before_action :authenticate_user!, only: :public_recipes

  def create; end

  def new; end
  def show; end

  def index
    @recipes = current_user.recipes.includes(:foods)
  end

  def public_recipes
    @recipes = Recipe.includes(:user, :foods).where(public: true)
  end

  def destroy
    @recipes.destroy!
    flash[:notice] = 'Deleted Recipe!'
    redirect_to recipes_url
  end
  
  def new_ingredient; end
end
