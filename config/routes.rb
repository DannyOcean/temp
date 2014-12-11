Rails.application.routes.draw do
  root to: 'home#index'

  resources :sort, only: [] do
    get :mergesort, on: :collection
  end
end
