Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only:[:index, :show, :create, :update, :destroy] do 
    resources :artworks, only: :index 
    #^^^ This creates user_id 
  end
  resources :artworks, only:[:show, :create, :update, :destroy]
  resources :artwork_shares, only:[:create, :destroy]
  resources :comments, only:[:index, :create, :destroy]



  # get '/users', to: 'users#index' 
  # get '/users/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new'
  # get '/users/:id/edit', to: 'users#edit'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'


end
