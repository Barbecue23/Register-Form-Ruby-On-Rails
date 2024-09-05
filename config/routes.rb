Rails.application.routes.draw do
  get "form/new" ,to: "form#new"
  post "form" ,to: "form#create"
  root "form#new"
  # resources :form , only: [:new, :create]
end
