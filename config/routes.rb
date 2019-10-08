Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'logout', to: 'mypages#show'
  resources :users, only: :show
  resources :items do
    get :search, on: :collection
  end
end


