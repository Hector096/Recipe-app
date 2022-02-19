class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find_by_id(params[:id])
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = current_user.inventories.new(inventory_params)
    @inventory.user_id = current_user.id
    if @inventory.save
      flash[:success] = 'Inventory created successfully.'
      redirect_to inventories_url
    else
      flash.now[:error] = 'Error: Inventory could not be saved'
      render :new
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy!
    flash[:success] = 'You deleted this Inventory'
    redirect_to inventories_url
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
