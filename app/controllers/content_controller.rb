class ContentController < ApplicationController
  def create
    @content = Content.new

    @content.title = params[:content][:data]
    @content.owner = params[:content][:owner]
      @stream = Stream.where(public_id: params[:stream_id]).first
    #@content.stream_id = @stream.public_id
    @content.stream_id = params[:stream_id]
    @content.save

    session[:owner] = @content.owner

    #@stream = Stream.find(params[:stream_id])
    #@stream = Stream.where(public_id: params[:stream_id]).first
    #   render plain: @stream.inspect
    redirect_to controller: :stream, public_id: @stream.public_id
  end

  def show
  end

  def new
  end
end
