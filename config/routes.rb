PostitTemplate::Application.routes.draw do
  

  root to: 'posts#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy' 

  # =======================================================>
  get '/register', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update],  param: :username
  
  # =======================================================>
  
  #get '/users/:username' => 'users#show'
  #get '/users/:username/edit' => 'users#edit'
  #patch '/users/:username' =>'users#update'
  #put '/users/:username' => users#update'
  # =======================================================>


  # =======================================================>


  # =======================================================>
  # POST /votes => 'VotesController#create'
  # - needs 2 information
  # solution:
  ## resources :votes, only: [:create]
  
  # or, the trade off

  # POST /posts/3/vote => 'PostController#vote'
  # POST /comments/:id/vote => 'CommentsController#vote'  
  # solution:
  ##  


  # =======================================================>
  #get 'photos/poll', to: 'photo#poll'  
  resources :posts, except: [:destroy] do    
    member do
      post :vote
      #get :flag #testing
    end

    # Ex: #'/posts/archives'
    #collection do
    #  get :archives
    #  #post :happy #testing
    #end

    #resources :comments, only: [:create]  
    resources :comments, only: [:create] do
      member do 
        post :vote
      end
    end
  end 

  #resources :posts, except: [:destroy] do
  ##resources :posts do
  #  resources :comments, only: [:create]    
  #end


  ##scope shallow_prefix: "admin" do
  ##  resources :posts do
  ##    resources :comments, shallow: true
  ##  end
  ##end

  #resources :posts do 
  #  resources :comments, shallow: true
  #end

  #resources :votes, only:[:creatr, :show]

  resources :categories
  ##resources :categories, only:[:new, :create, :show]
  
  #example:  
  # Admin:: namespace 
  # controllers under the app/controllers/admin directory
  ## namespace :admin do
  ##   resources :articles, :comments
  ## end

  ##scope module: 'admin' do
  ##    resources :articles
  ##end

  ##resources :articles, module: 'admin'
  ##

  ##get '/posts', to: 'posts#index'
  ##get '/posts/:id' => 'posts#show'


end
