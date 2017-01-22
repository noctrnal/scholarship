Rails.application.routes.draw do
  get 'dashboard/home'
  get 'dashboard/status'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :institutions, only: []
  resources :transcripts, only: [:new, :edit, :create, :update]
  resources :recommendations, only: [:show, :new, :edit, :create, :update]
  resources :submissions, only: [:index, :show, :new, :edit, :create, :update]

  devise_for :users

  get "/pages/*page" => "pages#show"

  root "pages#show", page: "index"
end

