class UsersController < ApplicationController
  def show
  end

  def edit
    @user = User.find(params[:id])
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
end
