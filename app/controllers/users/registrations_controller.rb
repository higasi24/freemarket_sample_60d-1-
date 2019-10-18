# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_sns_id, only: :create
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  def create
    super
    SnsCredential.create(
      user_id: @user.id,
      uid: sns_id.uid,
      provider: sns_id.provider
    )
  end

    # @user = current_user
    # if session["devise.#{provider}_data"]
    #   SnsCredential.create(
    #     user_id: @user.id, 
    #     provider: session["devise.#{provider}_data"]["provider"], 
    #     uid: session["devise.#{provider}_data"]["uid"]
    #   )
    # end


  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def sms
    
  end

  # protected

  private

  def set_sns_id
    sns_id = @sns_id
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    # super(resource)
    users_sms_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
