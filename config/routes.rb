Rails.application.routes.draw do
  get 'attempts/index'

  #get 'attempts/show/:attempt_id', to: 'attempts#show', as: 'attempt'

  #get 'attempts/new/:survey_id', to: 'attempts#create', as: 'attempt_new'

  #get 'attempts/create'

  resources 'attempts'

  get 'surveys/index'

  get 'surveys/show'

  devise_for :users
  get 'theory', to: 'theory#index'

  get 'theory/show/:page', to: 'theory#show', as: 'theory_page'

  get 'home/index'
  get 'home/stack'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "home#index"
end
