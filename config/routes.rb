Rails.application.routes.draw do
  devise_for :users

  root to: "logs#index"
  resources :logs
  resources :weights do
    collection do
      get 'filter'
    end
  end


  resources :users do
    resources :profiles, only: [:new, :create, :show,:index,:edit]

    end
    get '/assets/edit_weights', to: redirect('/assets/edit_weights.js')

end
