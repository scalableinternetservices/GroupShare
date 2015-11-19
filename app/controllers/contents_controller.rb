class ContentsController < ApplicationController

  # GET /streams/1/contents.js?after=
  def index
    @new_content = Content.where("stream_id = ? and created_at > ?", params[:stream_id], Time.at(params[:after].to_i + 1))
    fresh_when(@new_content)
  end

  # POST /streams/1/contents
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

end