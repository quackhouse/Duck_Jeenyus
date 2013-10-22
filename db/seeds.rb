# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)

# file = File.open('air.txt', 'r')
# song = Song.new
# song.name = file.readline.chomp
# song.release_date = file.readline.chomp
# song.album = file.readline.chomp
# song.streamlink = ''https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/96271961''
# song.save

# file.each_line do |line|
#   lyric = Lyric.new
#   lyric.text = line.chomp
#   lyric.save
#   song.lyrics << lyric
# end

# file = File.open('u_turn_me_up.txt', 'r')
# song = Song.new
# song.name = file.readline.chomp
# song.release_date = file.readline.chomp
# song.album = file.readline.chomp
# song.streamlink = 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/110791901'
# song.save

# file.each_line do |line|
#   lyric = Lyric.new
#   lyric.text = line.chomp
#   lyric.save
#   song.lyrics << lyric
# end

# # User.create(access_token: 'anonymous ')

# # song = Song.find(1)
# # song.streamlink = 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/96271961'
# # song = Song.find(2)
# # song.streamlink = 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/110791901'