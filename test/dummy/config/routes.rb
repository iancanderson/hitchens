Rails.application.routes.draw do
  devise_for :users
  root :to => redirect("/blog")
  mount Hitchens::Engine => "/blog"
end
