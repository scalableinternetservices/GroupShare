class StreamsController < ApplicationController

  # POST /streams
  def create
    @stream = Stream.new

    @stream.owner = params[:stream][:owner]
    @stream.title = params[:stream][:title]
    @stream.description = params[:stream][:description]
    @stream.is_public = !params[:stream][:is_private]
    @stream.pin_hash = params[:stream][:pin].hash
    @stream.expire_at = Chronic.parse(params[:stream][:expire] + " from now")
    @stream.save

    session[:owner] = @stream.owner

    redirect_to @stream
  end

  # GET /streams/1
  def show
    @stream = Stream.where("expire_at > ?", Time.now).includes(:contents).find(params[:id])
    fresh_when([@stream, @stream.contents])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def render_404
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

  # GET /search?q=
  def search
    @results = Stream.search(params[:q])
  end

end
