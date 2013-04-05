SampleApp::Application.routes.draw do
  resources :users


  root to: 'static_pages#home'

  match '/signup'		=> 'users#new'
  match '/help'			=> 'static_pages#help'
  match '/about'   	=> 'static_pages#about'
  match '/contact'	=> 'static_pages#contact' 
end
