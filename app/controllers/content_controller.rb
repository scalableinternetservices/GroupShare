class ContentController < ApplicationController
  def create
    @content = Content.new

    @content.owner = params[:content][:owner]
    @content.title = params[:content][:data]
    @content.file = params[:content][:file]
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
