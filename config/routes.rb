Rails.application.routes.draw do
  resources :cometarios
  resources :noticias, except: [:index]
  get 'home/index'
  get '/noticias', to:'noticias#index', as:'user_root'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
   }
   
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "noticias#index"
end
