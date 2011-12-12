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
    def add_2_spaces_after_code_tags(doc)
      # for some reason,
      # the first line of code is indented one level fewer than other lines.
      doc.tap do |doc|
        doc.css("code").each do |code|
          code.content = "  #{code.content}"
        end
      end
    end
    def syntax_highlight(html)
      doc = Nokogiri::HTML(html)
      doc = add_2_spaces_after_code_tags(doc)
      # remove all pre tags.
      # coderay will nest pre tags within the code tags.
      doc.css("pre").each { |pre| pre.replace pre.inner_html }
      doc.css("code").each do |code|
        code.replace CodeRay.scan(code.text.rstrip, code[:class]).div
      end
      doc.to_s
    end
  end
end
