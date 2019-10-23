class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def edit
  end
  
  def logout
  end

  def profile
  end

  def myitem
    @salers_item = Item.where(saler_id: params[:id])
  end
end
