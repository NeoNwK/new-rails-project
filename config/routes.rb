Rails.application.routes.draw do
  root 'registrations#main'
  get 'registrations/confirm_delete/:id', to: 'registrations#confirm_delete', as: :confirm_delete
  resources :registrations, only: [:index, :new, :create, :destroy, :main, :edit]
end
