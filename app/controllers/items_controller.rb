class ItemsController < ApplicationController
  # before_action :set_order, :set_address

  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def edit
  end


  # private

  # def set_order
  #   @order = Order.find(params[:saler_id])
  # end

  # def set_address
  #   @address = Address.find(params[:saler_id])
  # end

end
