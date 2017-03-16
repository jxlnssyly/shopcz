Rails.application.routes.draw do
  get 'index/index'
  get 'index/left'
  get 'index/main'
  get 'index/top'

  resources :admins
  resources :sessions, only: [:new, :create, :destroy]
  match 'match/destory', to: 'admins#destroy', via: 'delete'
  match '/bdel', to: 'admins#destroy_multiple',   via: 'delete'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

end
