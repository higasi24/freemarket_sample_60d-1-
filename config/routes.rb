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
  resources :items do
    get :search, on: :collection
  end
  resources :addresses
end
  resources :users, only: [:show, :edit] do
    get :logout, on: :collection
    get :profile, on: :collection
  end

  scope(path_names: { new: 'buy/:item_id'}) do
    resources :orders, path: 'order'
  end

end
