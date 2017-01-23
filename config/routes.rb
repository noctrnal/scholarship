Rails.application.routes.draw do
  get 'dashboard/home'
  get 'dashboard/status'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :evaluations, only: [:new, :edit, :create, :update]
  resources :institutions, only: []
  resources :transcripts, only: [:new, :edit, :create, :update]
  resources :recommendations, only: [:show, :new, :edit, :create, :update]
  resources :submissions, only: [:index, :show, :new, :edit, :create, :update]

  devise_for :users

  get "/pages/*page" => "pages#show"

  app.get('/.well-known/acme-challenge/:content', function(req, res) {
    res.send('WbJUWqYkrVeYIR9HUeUHP2b0C46pximw3MNr0AVp51E.TDWdzdb-lLmz_T17TuTkg5drG3vusMAWxTRrKt0kkHA')
  })

  root "pages#show", page: "index"
end

