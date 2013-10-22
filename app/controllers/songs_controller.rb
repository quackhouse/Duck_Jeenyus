class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  def show
    id = params[:id].to_i
    @song = Song.find(id)
  end
  def destroy
    id = params[:id].to_i
    song = Song.find(id)
    song.destroy
    redirect_to('/admins/songs')
  end
  def new
    @song = Song.new
  end
  def create
    song = Song.new
    song.name = params[:song][:name]
    song.release_date = params[:song][:release_date]
    song.album = params[:song][:album]
    song.streamlink = params[:song][:streamlink]
    song.save
    lyrics_text = params[:song][:lyrics]
    lyrics_array = lyrics_text.split("\r\n")
    lyrics_array.each do |lyric|
      if lyric != ""
        new_lyric = Lyric.new
        new_lyric.text = lyric
        new_lyric.save
        song.lyrics << new_lyric
      end
    end
    redirect_to('/admins/songs')
  end
end