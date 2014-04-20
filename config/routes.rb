NewIssues::Application.routes.draw do
  devise_for :users

  get "timeline/index"

  # resources :issues do
  #   collection do
  #     get  :index
  #     post :create
  #     get  :new
  #     get  :edit
  #     get  :show
  #     put  :update
  #     delete :destroy
  #   end
  # end

  resources :issues do
    resources :comments
  end

  resources :likes, :only => [:create, :destroy]

  post 'search', to: 'issues#search', as: :search

  root to: 'issues#index'

  # resources :users, only: [ :show ]
  get '/profile/:id' => 'users#show', as: :profile
end
