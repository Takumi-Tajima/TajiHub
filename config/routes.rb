Rails.application.routes.draw do
  devise_for :admins

  root 'home#index'

  namespace :admins do
    root 'posts#index'
    resources :posts, only: %i[index new create edit update destroy]
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
