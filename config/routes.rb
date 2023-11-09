Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :condo_users, controllers: {
    sessions: 'condo_users/sessions',
    passwords: 'condo_users/passwords',
    registrations: 'condo_users/registrations'
  }

  resources :condos do
    member do
      get 'details'
      get 'inquiries'
    end
    resources :condo_users, only: [:index, :new, :create]
    resources :condo_user_posts, only: [:index, :new, :create, :show] do
      collection do
        get 'inquiries', to: 'condo_user_posts#inquiries'
      end
      resources :condo_user_post_replies, only: [:create, :update]
    end
  end

  resources :notifications, only: [:index] do
    collection do
      patch :mark_all_as_read
    end
  end

  root to: 'condos#index'

  # Active Admin routes
  ActiveAdmin.routes(self)
end
