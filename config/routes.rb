Rails.application.routes.draw do
  devise_for :users
  resources :post_attachments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rental_properties
  root "pages#home"

  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  get '/listing' => 'rental_properties#l'
end
