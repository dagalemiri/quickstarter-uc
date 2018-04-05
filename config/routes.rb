Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index', as:'root'

  get '/users/new', to:'users#new'
  post '/users', to:'users#create'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'
  delete '/users/:id', to: 'users#destroy'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'
  patch 'users/:id/edit_categories', to: 'users#edit_categories'
  get '/users/:id/projects', to: 'users#show_projects', as: 'user_projects'

  get 'projects/search', to: 'projects#search'
  get 'projects/categories/:name', to: 'projects#show_categories'
  get '/projects/new', to: 'projects#new'
  post '/projects', to:'projects#create'
  get '/projects', to: 'projects#index'
  get '/projects/:id', to: 'projects#show', as: 'project'
  get '/projects/:id/edit', to: 'projects#edit', as: 'edit_project'
  patch '/projects/:id', to: 'projects#update'
  delete '/projects/:id', to: 'projects#destroy'
  patch 'projects/:id/edit_categories', to: 'projects#edit_categories'




  #get '/comments/new', to: 'comments#new'
  #get '/comments', to: 'comments#index'
  get '/comments/:id', to: 'comments#show', as: 'comment'
  get '/comments/:id/edit', to: 'comments#edit', as: 'edit_comment'
  patch '/comments/:id', to: 'comments#update'
  delete '/comments/:id', to: 'comments#destroy', as: 'delete_comment'
  post '/comments', to: 'comments#create', as: 'create_comment'


  #get '/investments', to: 'investments#index', as: 'investments'
  #get '/investments/new', to: 'investments#new'
  get '/investments/:id/edit', to: 'investments#edit', as: 'edit_investment'
  patch '/investments/:id', to: 'investments#update', as:'update_investment'
  delete '/investments/:id', to: 'investments#destroy', as:'delete_investment'
  post '/investments', to: 'investments#create', as: 'create_investment'

  get '/categories', to:'categories#index'
  get '/categories/:id/edit', to: 'categories#edit', as: 'edit_category'
  patch '/categories/:id', to:'categories#update', as: 'update_category'
  delete '/categories/:id', to:'categories#destroy', as: 'delete_cat'
  post '/categories/create', to: 'categories#create'

  resource :session, only: [:new, :create, :destroy]

  namespace :api do
   namespace :v1 do
     get '/users/comments', to: 'users#comments', as: 'user_comments'
     get '/users/investments', to: 'users#investments', as: 'user_investments'
     get '/projects/:id/comments', to: 'projects#comments'

     resources :comments, only: [:show, :create,:destroy]
     resources :investments, only: [:create]
     resources :projects, only: [:index, :show, :create, :destroy]
     resources :users, only: [:show]
   end
 end

end
