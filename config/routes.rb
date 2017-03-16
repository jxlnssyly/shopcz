Rails.application.routes.draw do
  get 'index/index'
  match 'left', to: 'index#left', via: 'get'
  match 'main', to: 'index#main', via: 'get'
  match 'top', to: 'index#top', via: 'get'

  resources :admins
  resources :sessions, only: [:new, :create, :destroy]
  resources :categories



  match 'match/destory', to: 'admins#destroy', via: 'delete'
  match '/bdel', to: 'admins#destroy_multiple',   via: 'delete'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  root to: 'index#index'
end
