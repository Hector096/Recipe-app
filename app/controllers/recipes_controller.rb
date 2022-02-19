class RecipesController < ApplicationController
  load_and_authorize_resource expect: :public_recipes
  skip_before_action :authenticate_user!, only: :public_recipes

  def create
    @recipe = current_user.recipes.new(recipe_params)
    @recipe.user_id = current_user.id

    respond_to do |format|
      format.html do
        if @recipe.save
          flash[:success] = 'You have successfully created a recipe.'
          redirect_to recipes_url
        else
          flash.now[:error] = 'Error: Recipe could not be saved'
          render :new
        end
      end
    end
  end

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

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
