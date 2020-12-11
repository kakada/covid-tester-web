require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  root 'testers#index'

  resources :testers, only: [:index]

  namespace :api do
    resources :testers, only: [:create]
  end

  mount Sidekiq::Web => '/sidekiq'
end
