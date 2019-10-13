class ItemsController < ApplicationController
  # before_action :set_order, :set_address

  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item.category_items.build
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end


  def update
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :detail, :state, :size, :delivery_fee, :delivery_method, :price, :delivery_date, :area_id, category_items_attributes: [:id, :category_id], images_attributes: [:id, :image]).merge(saler_id: current_user.id)
  end

  def edit
  end

end
