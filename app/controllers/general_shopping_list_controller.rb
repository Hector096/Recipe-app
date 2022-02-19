class GeneralShoppingListController < ApplicationController
  # load_and_authorize_resource
  before_action :retrieve_missing_items
  def index
    retrieve_missing_items
  end

  private

  def retrieve_missing_items
    id = current_user.id
    sql = "select foods_inventories.quantity,
          foods_recipes.quantity, foods.name,
          foods.price, foods.measurement_unit from recipes join foods_recipes on foods_recipes.recipe_id = recipes.id
          left join foods on foods.id = foods_recipes.food_id
          join foods_inventories on foods_inventories.food_id = foods.id where recipes.user_id = #{id}"
    records_array = ActiveRecord::Base.connection.execute(sql)

    list_items = records_array.values

    @missing_items = list_items.select do |list_item|
      list_item[0] < list_item[1]
    end

    @missing_items
  end
end
