class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:id])
    @image = Image.where(item_id: params[:id])
    @saler = User.find(@item.saler_id)
    @address = Address.find_by(user_id: @saler.id)
    @salers_item = Item.where(saler_id: @saler.id)
    @order_count = @salers_item.where.not(buyer_id: nil).count
  end

  def new
    @item = Item.new
    @item.category_items.build
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    @images = Image.new

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
  end

  def edit
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :detail, :state, :size, :delivery_fee, :delivery_method, :price, :delivery_date, :prefecture_id, category_items_attributes: [:id, :category_id], images_attributes: [:id, :image]).merge(saler_id: current_user.id)
  end

end
