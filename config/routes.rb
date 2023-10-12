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
    end
    resources :condo_users, only: [:index]
  end
  
  root to: 'condos#index'

end
