class StreamsController < ApplicationController
  def index
    @n_stream = Stream.where("created_at > ?", Time.at(params[:after].to_i + 1)).order(created_at: :desc)
  end

  def create
    @stream = Stream.new

    @stream.owner = params[:stream][:owner]
    @stream.title = params[:stream][:title]
    @stream.description = params[:stream][:description]
    @stream.is_public = !params[:stream][:is_private]
    @stream.pin_hash = params[:stream][:pin].hash
    @stream.expire_at = Time.now + params[:stream][:expire_minutes].to_i.minutes

    #render plain: @stream.inspect
    @stream.save

    session[:owner] = @stream.owner

    redirect_to @stream
  end

  def show
    @stream = Stream.find(params[:id])
    #fresh_when([@stream, @stream.contents])
  end

  def search
    @results = Stream.search(params[:streams][:q])
  end

end
