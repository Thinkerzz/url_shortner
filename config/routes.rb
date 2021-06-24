Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'urls#new'

  resources :urls, only: [:index, :new, :create]

  get '/:token', to: 'urls#show', as: :url

  get '/:token/info', to: 'urls#info', as: :info
end
