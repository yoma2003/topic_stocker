Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  root to: "categories#index"
  resources :users, only: [:edit, :update]
  resources :categories, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :characters
  resources :future_topics, only: :update
  resources :past_topics, only: [:update, :create, :destroy]
end
