class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def show; end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy!
    flash[:success] = 'You deleted this Inventory'
    redirect_to foods_url
  end
end
