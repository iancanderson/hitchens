Rails.application.routes.draw do

  mount Hitchens::Engine => "/blog"
end
