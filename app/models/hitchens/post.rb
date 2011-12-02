module Hitchens
  class Post < ActiveRecord::Base
    scope :published, lambda{ where('publication_date < ?', Time.now) }
  end
end
