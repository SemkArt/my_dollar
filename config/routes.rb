require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  mount Sidekiq::Web => '/sidekiq'

  namespace :admin do
    resources :rates, only: [:index, :create]

    root to: 'rates#index', as: :root
  end

  root to: 'dashboard#index'
end
