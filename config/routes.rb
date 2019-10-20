Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get 'users/sms' => 'users/registrations#sms'
  end
  root to: "items#index"

  resources :users, only: [:show, :new, :edit] do
    collection do
      get :smsConfirmation
    end
    member do
      get :myitem
      get :profile
      get :logout
    end
  end

  resources :items do
    get :search, on: :collection
    member do
      get :pre_edit
    end
  end

  resources :addresses
  resources :cards

  scope(path_names: { new: 'buy/:item_id'}) do
    resources :orders, path: 'order'
  end
  
  post   '/favorite/:item_id' => 'favorites#like',   as: 'like'
  delete '/favorite/:item_id' => 'favorites#unlike', as: 'unlike'
end
