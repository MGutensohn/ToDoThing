Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists
  get '/tasks/:id', to: 'tasks#update', as: 'update_task'
end
