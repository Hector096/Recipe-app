class FoodInventoriesController < ApplicationController
    def new
        @foods = current_user.foods.all
        @food_inventories = FoodInventory.new
    end

    def create
        @foods = current_user.foods.all
        @inventory = Inventory.find_by_id(params[:inventory_id])
        @food_inventory = @inventory.food_inventories.new(foodinventory_params)
        if @food_inventory.save
            flash[:success] = 'Food added successfully'
            redirect_to inventory(@inventory.id)
        else
            flash.now[:alert] = 'Something went wrong'
            render :new
        end
    end

    private

    def foodinventory_params
        params.permit(:food, :quantity)
    end
end
