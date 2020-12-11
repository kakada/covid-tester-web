require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  devise_for :users
  root 'testers#index'

  resources :testers, only: [:index]

  namespace :api do
    resources :testers, only: [:create]
  end

  if Rails.env.production?
    authenticate :user do
      mount Sidekiq::Web => '/sidekiq'
    end
  else
    mount Sidekiq::Web => '/sidekiq'
  end
end
