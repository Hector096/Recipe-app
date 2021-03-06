class IngredientsController < ApplicationController
  def new
    @foods = current_user.foods.all
    @recipe = current_recipe
    @ingredient = Ingredient.new(recipe: @recipe)
  end

  def create
    food = Food.find(params[:food_id])
    current_recipe.add_ingredient!(food, ingredient_params[:quantity])
    flash[:notice] = 'Added ingredient!'
    redirect_to recipe_url(current_recipe)
  end

  def destroy
    ingredient = current_ingredient
    ingredient.destroy!
    flash[:notice] = 'Deleted ingredient!'
    redirect_to recipe_url(ingredient.recipe_id)
  end

  private

  def current_recipe
    Recipe.find(params[:recipe_id])
  end

  def current_ingredient
    Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:quantity)
  end
end
