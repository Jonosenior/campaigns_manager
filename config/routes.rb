Rails.application.routes.draw do
  get 'users/index'
  root to: 'campaigns#index'
  resources :campaigns do
    resources :todo_lists, except: :index
  end
  resources :comments, only: [:create, :new]
  devise_for :users
  scope '/expert' do
    resources :novices, only: [:index, :edit, :update], controller: 'users', type: 'Novice'
  end
end
