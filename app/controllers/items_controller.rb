class ItemsController < ApplicationController
  def index
    
  end

  def show
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    @images = Image.new
    binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.permit(:name, :detail, :state, :delivery_fee, :delivery_method, :price, :delivery_date, :area_id).merge( saler_id: current_user.id)
  end
end
