Rails.application.routes.draw do
  resources :members
  resources :fan_comments
  resources :reviews
  resources :authors
  resources :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'view/urlfor'
  get 'view/new'
  get 'members/login'
  get 'hello/view'
  get 'hello/list'
  get 'view/keyword'
  post 'keyword/search'
end
