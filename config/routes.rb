Rails.application.routes.draw do

  root to: 'index#index'

  match 'left', to: 'index#left', via: 'get'
  match 'main', to: 'index#main', via: 'get'
  match 'top', to: 'index#top', via: 'get'

  resources :admins
  resources :sessions, only: [:new, :create, :destroy]
  resources :categories do
      member do
        delete :destroy
      end
    end

  resources :privileges, only:[:index, :create,:edit,:new,:destroy] do
    member do
      delete :bdel
    end
  end

  resources :roles


  match 'match/destory', to: 'admins#destroy', via: 'delete'
  match '/bdel', to: 'admins#destroy_multiple',   via: 'delete'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/privileges/bdel', to: 'privileges#destroy_multiple',via: 'delete'
  match '/categories/destroy', to: 'categories#destroy',via: 'delete'
  match '/roles/bdel', to: 'roles#destroy_multiple',via: 'delete'

end
