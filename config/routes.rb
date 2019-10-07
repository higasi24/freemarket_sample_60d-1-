Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items
  # 仮
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
  root to: "items#index"
  resources :items do
    get :search, on: :collection
  end
end
