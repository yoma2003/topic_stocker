Rails.application.routes.draw do
  devise_for :users
  root to: "categories#index"
  resources :users, only: [:edit, :update]
  resources :categories, only: [:create, :show, :edit, :update]
  resources :characters
  resources :future_topics, only: :update
  resources :past_topics, only: [:update, :create, :destroy]
end
