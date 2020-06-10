Rails.application.routes.draw do
  get 'users/create'

  devise_for :users

  root "messages#index"
end
