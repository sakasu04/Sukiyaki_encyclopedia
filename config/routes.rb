Rails.application.routes.draw do
  root 'pages#home'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :ingredient_posts, only: %i[index new create show]

  #get 'password_resets/new'
  #get 'password_resets/create'
  #get 'password_resets/edit'
  #get 'password_resets/update'
end
