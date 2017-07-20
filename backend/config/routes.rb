Rails.application.routes.draw do
  root 'ember#index'

  namespace :authentication do
    post :login, action: :login
    post :logout, action: :logout
    get :current_user, action: :current
  end
end
