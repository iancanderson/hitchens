module Hitchens
  class ApplicationController < ActionController::Base
    check_authorization
    layout Hitchens.use_parent_layout ? 'application' : 'hitchens/application'

    def current_ability
      # we need to tell CanCan to use our Hitchens::Ability class
      @current_ability ||= Ability.new(current_hitchens_user)
    end

  private
    def current_hitchens_user
      __send__ Hitchens.current_user_helper_name
    end
  end
end
