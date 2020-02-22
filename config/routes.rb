Rails.application.routes.draw do
  resources :cats
  get '/', to: 'cats#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
