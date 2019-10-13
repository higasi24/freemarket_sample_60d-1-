Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  devise_scope :user do
    get 'users/sms' => 'users/registrations#sms'
  end
  root to: "items#index"
  resources :users, only: [:show, :new, :edit] do
    collection do
      get :smsConfirmation
      get :logout
      get :profile
    end
  end
  resources :items do
    get :search, on: :collection
  end
  resources :addresses

  scope(path_names: { new: 'buy/:item_id'}) do
    resources :orders, path: 'order'
  end

end
