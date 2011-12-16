module Hitchens
  module Admin
    class PostsController < BaseController
      load_and_authorize_resource :class => 'Hitchens::Post', :find_by => :slug

      def index
        @posts = @posts.page(params[:page]).per_page(Hitchens.posts_per_page)
        @posts = PostDecorator.decorate @posts
      end

      def show
        @post = PostDecorator.decorate @post
      end

      def create
        if @post.save
          flash[:notice] = t 'hitchens.notices.post_created'
          redirect_to admin_posts_path
        else
          render 'new'
        end
      end
      def update
        if @post.update_attributes params[:post]
          flash[:notice] = t 'hitchens.notices.post_updated'
          redirect_to admin_posts_path
        else
          flash[:error] = t 'hitchens.errors.post_not_updated'
          render 'edit'
        end
      end

      def new
      end
      def edit
      end
      def destroy
        @post.destroy
        flash[:notice] = t('hitchens.notices.post_deleted')
        redirect_to admin_posts_path
      end
    end
  end
end

