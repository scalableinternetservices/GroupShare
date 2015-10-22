class ContentController < ApplicationController
  def create
    @content = Content.new

    @content.title = params[:content][:data]
    @content.owner = params[:content][:owner]
    @content.stream_id = params[:stream_id]
    @content.save

    session[:owner] = @content.owner

    @stream = Stream.find(params[:stream_id])
    redirect_to @stream
  end

  def show
  end

  def new
  end
end
