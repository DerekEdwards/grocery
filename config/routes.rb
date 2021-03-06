Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "lists#index"

  resources :lists, only: [:show, :index, :new, :create] #, :edit, :update, :destroy]
  resources :lists do
    member do 
      get 'add_item'
      patch 'close'
      patch 'remove_item'
      get 'print_view'
    end
  end

  resources :locations, only: [:new, :create, :index, :edit, :update]
  
  resources :items, only: [:new, :create, :index, :edit, :update]
  resources :items do
    collection do 
      get 'search'
    end
    member do 
      patch 'deactivate'
    end
  end

  resources :stores, only: [:new, :create, :index, :edit, :update]

  resources :list_items, only: [:edit, :update]
  resources :item_locations, only: [:new, :create, :destroy]
end

