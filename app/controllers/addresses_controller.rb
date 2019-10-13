class AddressesController < ApplicationController
  def new
    @address = Address.new
  end
  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
      # cardのurl指定
    else
      render :new
    end
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :city, :block, :building, :tel, :prefecture_id).merge(user_id: current_user.id)
  end
end

