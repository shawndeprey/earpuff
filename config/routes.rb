Earpuff::Application.routes.draw do
  devise_for :users
  root 'default#index'
end