module Hitchens
  class ApplicationController < ActionController::Base
    check_authorization
    load_and_authorize_resource

    def current_ability
      # we need to tell CanCan to use our Hitchens::Ability class
      @current_ability ||= Ability.new(current_user)
    end
  end
end
