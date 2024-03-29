Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "/homes/about" => "homes#about" , as: "about"
  resources :users, only: [:show, :index, :edit, :update, :create]
  resources :books, onli: [:show, :index, :edit, :update, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
