Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  devise_scope :user do
    get 'users/sms' => 'users/registrations#sms'
  end
  root to: "items#index"
  resources :users, only: [:show, :new] do
    collection do
      get :smsConfirmation
    end
  end
  # resources :signup do
  #   collection do
  #     get :basic
  #     get :sms
  #     get :smsConfirmation
  #     get :add
  #     get :card
  #     get :done
  #   end
  # end
  resources :items do
    get :search, on: :collection
  end
  resources :addresses
end


