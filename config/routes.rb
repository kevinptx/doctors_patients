Rails.application.routes.draw do
  devise_for :users
  root "physicians#index"

  resources :patients
  resources :physicians do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
end
