class UsersController < ApplicationController
  def show
  end

  def edit
  end
  
  def logout
  end

  def profile
  end

  def credit
    @user = User.find(current_user.id)
    @card = @user.card
  end

  def save
  end

  def myitem
    @salers_item = Item.where(saler_id: params[:id])
  end
end
