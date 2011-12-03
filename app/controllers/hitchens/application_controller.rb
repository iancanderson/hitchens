module Hitchens
  class ApplicationController < ActionController::Base
    check_authorization
    load_and_authorize_resource
    layout Hitchens.use_parent_layout ? 'application' : 'hitchens/application'

    def current_ability
      # we need to tell CanCan to use our Hitchens::Ability class
      @current_ability ||= Ability.new(get_current_user)
    end

  private
    def get_current_user
      __send__ Hitchens.current_user_helper_name
    end
  end
end
