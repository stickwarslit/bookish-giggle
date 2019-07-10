Rails.application.routes.draw do

  get 'my/girlfriend'

  root 'demo#index'

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'

  match 'demo/hello', :to => 'demo#index', :via => :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
