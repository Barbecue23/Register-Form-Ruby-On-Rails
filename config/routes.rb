Rails.application.routes.draw do
  root "form#index"

  resources :form, only: [:index, :new, :create, :destroy] do
    member do
      get 'confirm_destroy'  # Custom route for delete confirmation
    end
  end
end
