module Hitchens
  class Admin::BaseController < ApplicationController
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
  end
end
