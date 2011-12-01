module Hitchens
  class PostsController < ApplicationController
    def index
      @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(params[:post])
      if @post.save
        redirect_to posts_path
      else
        render 'new'
      end
    end
  end
end
