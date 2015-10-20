class StreamController < ApplicationController
  def create
    @stream = Stream.new

    @stream.owner = params[:stream][:owner]
    @stream.title = params[:stream][:title]
    @stream.description = params[:stream][:description]
    @stream.is_public = !params[:stream][:is_private]
    @stream.pin_hash = params[:stream][:pin].hash
    @stream.expire_at = Time.now + params[:stream][:expire_minutes].to_i.minutes

    render plain: @stream.inspect
    @stream.save
  end

  def join
  end

  def show
  end
end
