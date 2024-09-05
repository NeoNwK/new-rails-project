Rails.application.routes.draw do
  resources :registrations
  get 'registrations/new'
  post 'registrations/create'
  # root 'registrations#new'
  get 'registrations', to: 'registrations#index'
  get 'registrations/new', to: 'registrations#new'
  post 'registrations', to: 'registrations#create'
  # get 'registrations', to: 'registrations#show'
  # post 'registrations/:d', to: 'registrations#destroy'
 root 'registrations#main'
end
