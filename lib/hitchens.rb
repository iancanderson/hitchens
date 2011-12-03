# dependencies - is this necessary?
require 'haml'
require 'simple_form'
require 'draper'
require 'redcarpet'
require 'cancan'
require 'nokogiri'
require 'coderay'
require 'will_paginate'

require 'hitchens/engine'

module Hitchens
  mattr_accessor  :blog_name,
                  :blog_description,
                  :posts_per_page,
                  :use_parent_layout,
                  :user_class_name,
                  :current_user_helper_name,
                  :blog_admin_user_method

  #TODO: set these up in the Hitchens initializer file
  self.blog_name = "Ian's test blog"
  self.blog_description = "Just a thing about stuff"
  self.use_parent_layout = true
  self.posts_per_page = 5
  self.user_class_name = 'User'
  self.current_user_helper_name = 'current_user'
  self.blog_admin_user_method = 'blog_admin?'

  def self.user_class
    user_class_name.constantize
  end
end
