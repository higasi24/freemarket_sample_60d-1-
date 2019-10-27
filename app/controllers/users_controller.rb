class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :set_search, only: [:show, :logout, :profile, :myitem]

  def show
  end
  
  def logout
  end

  def profile
  end

  def myitem
    @salers_item = Item.where(saler_id: params[:id])
  end

  private
  def set_search
    @search = Item.ransack(params[:q])
  end
end
