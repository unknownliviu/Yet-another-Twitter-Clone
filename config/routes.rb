SampleApp::Application.routes.draw do
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :sessions, 	only: [:new, :create, :destroy]
  resources :microposts,only: [:create,:destroy]
  resources :relationships, only: [:create, :destroy]  

  root to: 'static_pages#home'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/help'			=> 'static_pages#help'
  match '/about'   	=> 'static_pages#about'
  match '/contact'	=> 'static_pages#contact' 
end
