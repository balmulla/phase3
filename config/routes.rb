Rails.application.routes.draw do
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :demos, only: [:new, :create, :destroy]
  get 'demos/new', to: 'demos#new', as: :login
  get 'demos/destroy', to: 'demos#destroy', as: :logout
  root 'demos#new'
end
