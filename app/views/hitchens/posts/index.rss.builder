xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title Hitchens.blog_name
    xml.description Hitchens.blog_description
    xml.link posts_url(format: :rss)

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.body_to_html
        xml.pubDate post.publication_date.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end
