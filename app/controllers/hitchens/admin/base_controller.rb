module Hitchens
  class Admin::BaseController < Hitchens::ApplicationController
    before_filter :authenticate_hitchens_admin
    skip_authorization_check :only => [:index]

    def index
    end

    private

    def authenticate_hitchens_admin
      unless current_hitchens_user && current_hitchens_user.blog_admin?
        flash.alert = t("hitchens.errors.access_denied")
        redirect_to main_app.__send__(Hitchens.sign_in_url_helper)
      end
    end
    def current_hitchens_user
      __send__ Hitchens.current_user_helper_name
    end
  end
end
