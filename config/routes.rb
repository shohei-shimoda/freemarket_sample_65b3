Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items, only: [:index, :new, :show]
  resources :users, only: [:show, :edit, :new] do
    collection do
      get 'logout'
      get 'newsignup'
      get 'signup1'
      get 'signup2'
      get 'signup3'
      get 'signup4'
      get 'signup5'
      get 'signup6'
    end
  end
end
