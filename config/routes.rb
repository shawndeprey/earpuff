Earpuff::Application.routes.draw do
  post 'charges/create' => 'charge#create'
  get 'admin/approve_users' => 'admin#approve_index', as: :approve_users
  get 'admin/approve_user/:id' => 'admin#approve_user'
  get 'contact' => 'default#contact'
  get '/product' => 'default#product', as: :products
  get 'charges/success' => 'charge#success'
  get 'charges/fail' => 'charge#fail'

  devise_for :users
  root 'default#index'
end