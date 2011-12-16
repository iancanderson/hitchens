Hitchens::Engine.routes.draw do

  root :to => 'posts#index'

  namespace :admin do
    root :to => "base#index"
    resources :posts
  end

  get '/:id' => 'posts#show', :as => :post
end
