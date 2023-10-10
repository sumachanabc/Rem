Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :condos do
    member do
      get 'details' # マンションの内容を引き継いだページへのルート
    end
  end
  root to: 'condos#index'
end
