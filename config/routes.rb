Rails.application.routes.draw do

  devise_for :users
get '/' => 'patients#index'
get 'home' => 'patients#index'

resources :patients
resources :cancers

end
