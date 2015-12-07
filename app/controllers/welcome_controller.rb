class WelcomeController < ApplicationController
  def index
    @streams = Stream.where("expire_at > ?", Time.now).includes(:contents).order(created_at: :desc).limit(10)
    @contents = Array.new
    @streams.each do |stream|
      @contents.append(stream.contents)
    end
    fresh_when([@streams, @contents])
  end
end
