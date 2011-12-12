module Hitchens
  class ApplicationDecorator < Draper::Base
    def markdown(text)
      markdown_parser.render(text).html_safe
    end

private
    def markdown_parser
      @@parser ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
        :autolink => true, :space_after_headers => true,
        :fenced_code_blocks => true)
    end
  end
end
