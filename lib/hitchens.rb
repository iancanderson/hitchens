# dependencies - is this necessary?
require 'haml'
require 'simple_form'
require 'draper'
require 'redcarpet'
require 'cancan'
require 'nokogiri'
require 'coderay'
require 'will_paginate'
require 'rspec-rails' if Rails.env.development?

require 'hitchens/engine'

module Hitchens
  mattr_accessor  :blog_name,
                  :blog_description,
                  :posts_per_page,
                  :use_parent_layout

  #TODO: set these up in the Hitchens initializer file
  self.blog_name = "Ian's test blog"
  self.blog_description = "Just a thing about stuff"
  self.use_parent_layout = false
  self.posts_per_page = 5
end
