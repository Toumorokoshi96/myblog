Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'articles#index'

get   '/about', to: 'static_pages#about' # 例1

resources :articles

end