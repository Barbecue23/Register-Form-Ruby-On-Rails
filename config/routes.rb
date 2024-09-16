Rails.application.routes.draw do
  root "form#index"

  resources :form, only: [:index, :new, :create, :destroy] do
    collection do
      get 'new_modal'
      post 'new_modal'
    end
    member do
      get 'confirm_destroy'
    end
  end
end
