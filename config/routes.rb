Rails.application.routes.draw do

  root 'demo#index'

  get 'admin', to: 'access#menu'

  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  get 'my/girlfriend'
  get 'my/mom'

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

  resources :sections do
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
