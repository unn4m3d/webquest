Rails.application.routes.draw do
  get 'theory/index'

  get 'theory/show'

  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "home#index"
end
