Rails.application.routes.draw do
  resources :wikis

  resources :charges, only: [:new, :create]

  resources :collaborators, only: [:create, :destroy]

  devise_for :users

  get 'about' => 'welcome#about'

  post "users/downgrade" => "users#downgrade", :as => "downgrade"

  root 'welcome#index'
end
