Rails.application.routes.draw do
  devise_for :users

  mount Hitchens::Engine => "/blog"
end
