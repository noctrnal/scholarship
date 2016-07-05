Rails.application.routes.draw do
  resources :transcripts
  resources :recommendations
  resources :submissions
  get 'dashboard/home'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  get "/pages/*page" => "pages#show"

  root "pages#show", page: "index"
end

