Rails.application.routes.draw do
  get 'registrations/new'
  post 'registrations/create'
  root 'registrations#new'
end
