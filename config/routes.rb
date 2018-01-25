Rails.application.routes.draw do
  get 'users/show'

  get 'users/index'

  devise_for :users
  resources :users do
    # resources :groups
  end
  root 'welcome#index'

  get 'welcome/index'
  get 'welcome/about'
end
