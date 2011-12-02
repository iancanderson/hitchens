module Hitchens
  class Post < ActiveRecord::Base
    scope :published, lambda{ where('publication_date < ?', Time.now) }

    def published=(value)
      if ActiveRecord::ConnectionAdapters::Column.value_to_boolean(value)
        self.publication_date = Time.now unless publication_date
      else
        self.publication_date = nil
      end
    end
    def published
      return false unless publication_date
      publication_date < Time.now
    end
  end
end
