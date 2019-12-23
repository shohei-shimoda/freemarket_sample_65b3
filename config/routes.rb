Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items, only: [:index, :new, :show]
  resources :users, only: [:show, :edit] do
    collection do
      get 'logout'
    end
  end
end
