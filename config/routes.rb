Rails.application.routes.draw do
  get 'theory', to: 'theory#index'

  get 'theory/show/:page', to: 'theory#show', as: 'theory_page'

  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "home#index"
end
