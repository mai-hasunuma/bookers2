Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about' => 'home#about'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :index, :show, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update, :destroy]
end
