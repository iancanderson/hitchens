module Hitchens
  class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else
        can :read, Post, Post.published do |post|
          post.published
        end
      end
    end
  end
end

