Rails.application.routes.draw do
  root to: 'campaigns#index'
  resources :campaigns do
    resources :todo_lists, except: :index
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
