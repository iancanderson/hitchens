module Hitchens
  class PostDecorator < ApplicationDecorator
    decorates 'Hitchens::Post'

    def body_to_html
      html = markdown(body)
      syntax_highlight(html).html_safe
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
      publication_date.getlocal.strftime("%A, %B %e, %Y at %l:%M %p")
    end
    def syntax_highlight(html)
      doc = Nokogiri::HTML.fragment(html)
      # remove all pre tags.
      # coderay will nest pre tags within the code tags.
      doc.css("pre").each { |pre| pre.replace pre.inner_html }
      doc.css("code").each do |code|
        code_ray = CodeRay.scan(code.text.rstrip, code[:class]).div
        code.replace code_ray
      end
      doc.to_s
    end
  end
end
