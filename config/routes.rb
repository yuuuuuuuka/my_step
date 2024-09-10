Rails.application.routes.draw do
  devise_for :users

  root to: "logs#index"
  resources :logs
end
