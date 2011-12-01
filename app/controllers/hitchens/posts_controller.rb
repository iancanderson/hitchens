module Hitchens
  class PostsController < ApplicationController
    def index
      @posts = PostDecorator.decorate Post.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new params[:post]
      if @post.save
        redirect_to posts_path
      else
        render 'new'
      end
    end

    def edit
      @post = Post.find params[:id]
    end

    def update
      @post = Post.find params[:id]
      if @post.update_attributes params[:post]
        redirect_to posts_path
      else
        render 'edit'
      end
    end
  end
end
