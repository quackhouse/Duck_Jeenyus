class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  def show
    id = params[:id].to_i
    @song = Song.find(id)
  end
end