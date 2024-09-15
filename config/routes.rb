Rails.application.routes.draw do
  devise_for :users

  root to: "logs#index"
  resources :logs

  resources :users do
    resources :profiles, only: [:new, :create, :show,:index,:edit]
    end

end
