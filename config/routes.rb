Rails.application.routes.draw do
  get 'users/index'

  root to: 'campaigns#index'
  resources :campaigns do
    resources :todo_lists, except: :index
  end
  devise_for :users
  scope '/expert' do
    resources :users, only: [:index, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
