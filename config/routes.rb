Rails.application.routes.draw do
  resources :institutions, only: [:index]
  resources :transcripts, only: [:new, :edit, :create, :update]
  resources :recommendations, only: [:new, :edit, :create, :update]
  resources :submissions, only: [:new, :edit, :create, :update]
  get 'dashboard/home'
  get 'dashboard/status'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  get "/pages/*page" => "pages#show"

  root "pages#show", page: "index"
end

