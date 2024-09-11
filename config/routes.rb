Rails.application.routes.draw do
  get "form/new" ,to: "form#new"
  get "form/index" ,to: "form#index"
  post "form" ,to: "form#create"
  delete "form/:id" ,to: "form#destroy"
  root "form#index"
  resources :form, only: [:index, :new, :create, :destroy, :confirm_destroy ]
end
