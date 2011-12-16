Hitchens::Engine.routes.draw do

  get '/:id' => 'posts#show', :as => :post

  root :to => 'posts#index'

  namespace :admin do
    root :to => "base#index"
    resources :posts
  end
end
