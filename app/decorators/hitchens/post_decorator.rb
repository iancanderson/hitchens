module Hitchens
  class PostDecorator < ApplicationDecorator
    decorates 'Hitchens::Post'

    def body_to_html
      markdown(body)
    end

    def pubdate_display
      publication_date.getlocal.strftime("%B %e, %Y at %l:%M %P")
    end
  end
end
