Rails.application.routes.draw do
  get "form/new" ,to: "form#new"
  get "form/index" ,to: "form#index"
  post "form" ,to: "form#create"
  delete "form/:id" ,to: "form#destroy"
  root "form#index"
  resources :forms, only: [:index, :new, :create, :destroy]
  # resources :form , only: [:new, :create]
end
