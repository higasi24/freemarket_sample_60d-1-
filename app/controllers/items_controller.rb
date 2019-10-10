class ItemsController < ApplicationController
  # before_action :set_order, :set_address

  def index
  end

  def show
    @item = Item.find(params[:id])
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
  
  def edit
  end

  def update
  end
  
  private
  def item_params
    params.permit(:name, :detail, :state, :delivery_fee, :delivery_method, :price, :delivery_date, :area_id).merge( saler_id: current_user.id)
  end
end
