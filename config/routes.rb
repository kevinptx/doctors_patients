Rails.application.routes.draw do
  root "appointments#index"

  resources :patients
  resources :physicians do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
end
