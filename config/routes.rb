Rails.application.routes.draw do
  root 'registrations#main'
  get 'registrations/confirm_delete/:id', to: 'registrations#confirm_delete', as: :confirm_delete
  delete 'registrations/:id', to: 'registrations#destroy', as: :destroy
  resources :registrations, only: [:index, :new, :create,  :main, :edit]
end
