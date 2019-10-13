class SignupController < ApplicationController
  def basic
    @user = User.new
  end
  def sms
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_date] = user_params[:birth_date]
    @user = User.new
  end
  def smsConfirmation
    @user = User.new
  end
  def add
    @user = User.includes(:addresses).new
    @address = Address.new
    # @prefectures = Prefecture.all
    # address??? includes(:addresses)
  end

  def card
    @user = User.new
  end

  def done
    @user = User.new
  end

  private
  
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 
      :family_name, 
      :first_name, 
      :family_name_kana, 
      :first_name_kana,
      :birth_date,
      :tel,
      :credit
    )
  end
end
