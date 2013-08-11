Earpuff::Application.routes.draw do
  post 'charges/create' => 'charge#create'
  devise_for :users
  root 'default#index'
end