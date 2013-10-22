file = File.open('air.txt', 'r')
song = Song.new
song.name = file.readline.chomp
song.release_date = file.readline.chomp
song.album = file.readline.chomp
song.save

file.each_line do |line|
  lyric = Lyric.new
  lyric.text = line.chomp
  lyric.save
  song.lyrics << lyric
end
