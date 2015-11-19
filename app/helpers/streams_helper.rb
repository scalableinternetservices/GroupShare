module StreamsHelper
  def cache_key_for_stream_row(stream)
    "stream-#{stream.id}-#{stream.contents.count}"
  end

  def cache_key_for_stream_info(stream)
    "stream-#{stream.id}"
  end

  def cache_key_for_stream_contents(stream)
    "stream-#{stream.id}-#{stream.contents.count}"
  end
end
