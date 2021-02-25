Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  post '/login', to: 'users#show'
  post '/users', to: 'users#create'
  post 'rails/active_storage/direct_uploads', to: 'direct_uploads#create'
end
