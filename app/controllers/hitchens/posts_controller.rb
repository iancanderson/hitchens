module Hitchens
  class PostsController < ApplicationController
    def index
      @posts = @posts.page(params[:page]).per_page(Hitchens.posts_per_page)
      @posts = PostDecorator.decorate @posts
    end

    def show
      @post = PostDecorator.decorate @post
    end

    def create
      if @post.save
        redirect_to posts_path
      else
        render 'new'
      end
    end
    def update
      if @post.update_attributes params[:post]
        redirect_to posts_path
      else
        render 'edit'
      end
    end

    def new
    end
    def edit
    end
  end
end
