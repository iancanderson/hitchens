Hitchens::Engine.routes.draw do
  resources :posts
  root :to => 'posts#index'

  namespace :admin do
    root :to => "base#index"
    resources :posts
  end
end
