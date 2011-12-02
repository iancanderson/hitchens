module Hitchens
  class PostDecorator < ApplicationDecorator
    decorates 'Hitchens::Post'

    def body_to_html
      markdown(body)
    end

    def pubdate_tag
      if publication_date
        h.time_tag publication_date, pubdate_display, pubdate: true
      else
        "(not yet published)"
      end
    end

  private
    def pubdate_display
      publication_date.getlocal.strftime("%B %e, %Y at %l:%M %P")
    end
  end
end
