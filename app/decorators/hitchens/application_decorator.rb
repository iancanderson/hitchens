module Hitchens
  class ApplicationDecorator < Draper::Base
    def markdown(text)
      Redcarpet.new(text, :hard_wrap, :filter_html,
        :autolink).to_html.html_safe
    end
  end
end
