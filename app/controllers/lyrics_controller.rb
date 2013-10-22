class LyricsController < ApplicationController
  def show
    id = params[:id].to_i
    @lyric = Lyric.find(id)
  end
end