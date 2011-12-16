module Hitchens
  class PostsController < ApplicationController
    load_and_authorize_resource :find_by => :slug

    def index
      @posts = @posts.page(params[:page]).per_page(Hitchens.posts_per_page)
      @posts = PostDecorator.decorate @posts
    end

    def show
      @post = PostDecorator.decorate @post
    end
  end
end
