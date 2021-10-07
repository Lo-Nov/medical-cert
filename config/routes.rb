Rails.application.routes.draw do
  resources :fires
  resources :hygienes
  resources :certs
  # resources :users, param: :_username
  resources :users

  # print cert
  get '/print/cert/:id_number', to: 'certs#printcert'
  get '/print/food/hygiene/cert/:business_id', to: 'hygienes#hygiene'
  get '/print/fire/prevention/cert/:business_id', to: 'hygienes#fire'

  # get all income types
  get '/income_type', to: 'certs#income_type'

  # Authorization
  post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
