Rails.application.routes.draw do
  devise_for :users
  root :to => redirect("/blog")
  match 'admin' => redirect('/blog/admin')
  mount Hitchens::Engine => "/blog"
end
