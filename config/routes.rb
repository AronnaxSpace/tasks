Rails.application.routes.draw do
  root 'dashboard#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  authenticated :user do
    if defined?(Sidekiq)
      require 'sidekiq/web'
      require 'sidekiq-scheduler/web'
      mount Sidekiq::Web => '/sidekiq'
    end
  end

  resource :profile, only: %i[new edit create update]
  resources :projects
  resources :task_sets, path: :sets
  resources :tasks do
    resources :task_performances, as: :performances, path: :performances, except: %i[show edit update] do
      member do
        patch :complete
      end
    end
  end
  get 'notifications/index'
end
