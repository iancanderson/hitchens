module Hitchens
  class Post < ActiveRecord::Base
    default_scope order('publication_date desc')
    scope :published, lambda{ where('publication_date < ?', Time.now) }

    before_validation :make_slug

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
    def to_param
      slug
    end

  private
    def make_slug
      result = title.downcase
      result.gsub!('&', 'and')
      result.gsub!(/[^a-z0-9]/, '-')
      result.gsub!(/-+/, '-')
      result.gsub!(/-$|^-/, '')
      self.slug = result
    end
  end
end
