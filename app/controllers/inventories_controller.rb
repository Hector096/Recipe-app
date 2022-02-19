class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find_by_id(params[:id])
  end

  def destroy
    @inventory = Inventory.find_by_id(params[:id])
    @inventory.destroy
    redirect_to inventories_path, :notice => "Inventory deleted successfully"
  end
end
