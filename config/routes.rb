Rails.application.routes.draw do
  get 'index/index'
  get 'index/left'
  get 'index/main'
  get 'index/top'

  resources :admins

  match 'match/destory', to: 'admins#destroy', via: 'delete'
  match '/bdel', to: 'admins#destroy_multiple',   via: 'delete'
  match '/login', to: 'login#login',   via: 'get'
  match '/sigin', to: 'login#sigin',   via: 'post'
  match '/signout', to: 'login#logout', via: 'get'


end
