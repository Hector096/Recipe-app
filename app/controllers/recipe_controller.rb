class RecipeController < ApplicationController
  load_and_authorize_resource expect: :public_recipes
  skip_before_action :authenticate_user!, only: :public_recipes

  def index
    @recipes = current_user.recipes.includes(:foods)
  end

  def public_recipes
    @recipes = Recipe.includes(:user, :foods).where(public: true)
  end

  def destroy
    @recipe.destroy!
    flash[:notice] = 'Deleted Recipe!'
    redirect_to recipes_url
  end
end
