Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'dashboard#index'

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
