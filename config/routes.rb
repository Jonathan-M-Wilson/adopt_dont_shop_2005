Rails.application.routes.draw do
  get '/shelters', to: 'shelters#index'
  get '/shelters/:id', to: 'shelters#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
