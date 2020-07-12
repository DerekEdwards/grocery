Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "lists#index"

  resources :lists, only: [:show, :index, :new, :create] #, :edit, :update, :destroy]
  resources :lists do
    member do 
      get 'add_item'
    end
  end

end
