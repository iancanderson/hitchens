## THIS PROBABLY DOESN'T WORK AT ALL SO SORRY

# Hitchens

- Mountable blog engine for Rails 3.1+
- Design/style agnostic - just a blog backend
- Inspired by radar/forem
- MIT-LICENSE.

##Installation
Specify in Gemfile:
    gem 'hitchens'

Add this line to your parent application's routes.rb:

    mount Hitchens::Engine, :at => "/blog"

Use an authentication gem that defines current_user, such as devise.

Define a blog_admin? method on your user class

    rake hitchens:install:migrations
    rake db:migrate

Navigate to /blog/admin to create/manage posts.
