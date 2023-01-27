Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'dashboard#index'

  resources :task_sets, path: :sets
  resources :tasks do
    resources :task_events, as: :events, except: %i[show edit update]
  end
end
