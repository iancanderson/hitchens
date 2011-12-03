module Hitchens
  class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= Hitchens.user_class.new # guest user (not logged in)
      if user.__send__ Hitchens.blog_admin_user_method
        can :manage, :all
      else
        can :read, Post, Post.published do |post|
          post.published
        end
      end
    end
  end
end

