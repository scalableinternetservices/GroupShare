class StreamController < ApplicationController
  def create
    @stream = Stream.new

    @stream.owner = params[:stream][:owner]
    @stream.title = params[:stream][:title]
    @stream.description = params[:stream][:description]
    @stream.is_public = !params[:stream][:is_private]
    @stream.pin_hash = params[:stream][:pin].hash
    @stream.expire_at = Time.now + params[:stream][:expire_minutes].to_i.minutes

    md5 = Digest::MD5.new
    md5 << @stream.id.to_s
    @stream.public_id = md5.hexdigest

    #render plain: @stream.inspect
    @stream.save

    session[:owner] = @stream.owner

    redirect_to controller: :stream, public_id: @stream.public_id#.show/:public_id
    #redirect_to :anchor => @stream  #show
  end


  def search
    @results = Stream.search(params[:stream][:q])
  end


  def show
    #render plain: params[:id]
    #@stream = Stream.find(params[:public_id])
    if @stream==nil
        @stream = Stream.where(public_id: params[:public_id]).first
    else
      render plain: @stream.inspect
    end
    #render plain: @stream.inspect
    #redirect_to :anchor => @stream/show
    #fresh_when([@stream, @stream.contents])
  end



end
