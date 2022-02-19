class GeneralShoppingListsController < ApplicationController
  def sum(array)
    sum = 0
    array.each do |number|
      # sum += number.food.price
      sum += number.quantity * number.food.price
    end
    sum
  end

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.all
    @food = Food.all
  end
end
