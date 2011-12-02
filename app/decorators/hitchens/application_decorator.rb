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
        code_ray = CodeRay.scan(pre.text.rstrip, pre[:class]).div
        # first line of code wasn't indented as much as others
        # need to add a line break after the pre tag
        pre.replace code_ray.sub('<pre>', "<pre>\n")
      end
      doc.to_s
    end
  end
end
