class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def show; end

  def destroy; end
end
