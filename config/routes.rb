Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :groups do
      resources :members
      resources :attendance_sheets do
        resources :attendance_records
      end
    end
  end
  root 'welcome#index'

  get 'welcome/index'
  get 'welcome/about'
end
