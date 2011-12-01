module Hitchens
  class PostDecorator < ApplicationDecorator
    decorates 'Hitchens::Post'

    def body_to_html
      markdown(body)
    end
  end
end
