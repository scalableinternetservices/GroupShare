module ContentsHelper
  def cache_key_for_content_row(content)
    "content-#{content.id}"
  end
end
