class WelcomeController < ApplicationController
  def index
    if stale?([Stream.all, Content.all])
      @recent_streams = Stream.where('streams.expire_at > ?', Time.now).order(created_at: :desc).limit(10)
      @recent_streams_content_size = @recent_streams.joins('LEFT OUTER JOIN contents ON contents.stream_id=streams.id').
          select('streams.title, streams.owner,  streams.id, streams.created_at, count(contents.id) as csize').group('streams.id', 'streams.created_at')

    end
  end
end
