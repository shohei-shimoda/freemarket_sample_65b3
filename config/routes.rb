Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items, only: [:index, :new, :show]
  resources :addresses, only: [:index]
  resources :cards, only: [:new]
  resources :signup, only: [:new, :create] do
    collection do
      get 'signup3'
      get 'signup4'
      get 'signup5'
    end
  end
  resources :users, only: [:show, :edit, :new] do
    collection do
      get 'logout'
      get 'signup1'
      get 'signup6'
    end
  end
end
