Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:show, :edit] do
    get :logout, on: :collection
    get :profile, on: :collection
  end
  resources :items do
    get :search, on: :collection
  end
end
