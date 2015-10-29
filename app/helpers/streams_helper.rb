module StreamsHelper

  def cache_key_for_content_list(contents)
    "content-list-#{contents.count}"
  end

  def cache_key_for_content_row(content)
    "content-row-#{content.id}"
  end
end
