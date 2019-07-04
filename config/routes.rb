Rails.application.routes.draw do
  root 'demo#index'

  get 'demo/index'

  match 'demo/hello', :to => 'demo#index', :via => :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
