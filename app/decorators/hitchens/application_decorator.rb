module Hitchens
  class ApplicationDecorator < Draper::Base
    def markdown(text)
      syntax_highlighter(markdown_parser.render(text)).html_safe
    end

private
    def markdown_parser
      @@parser ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
        :autolink => true, :space_after_headers => true,
        :fenced_code_blocks => true)
    end

    def syntax_highlighter(html)
      doc = Nokogiri::HTML(html)
      doc.search("code").each do |pre|
        pre.replace CodeRay.scan(pre.text.rstrip, pre[:class]).div(:line_numbers => :table)
      end
      doc.to_s
    end
  end
end
