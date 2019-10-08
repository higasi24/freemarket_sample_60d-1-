Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:show, :edit]
  resources :items do
    get :search, on: :collection
  end
end

