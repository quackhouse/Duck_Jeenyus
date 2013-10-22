class Song < ActiveRecord::Base
  attr_accessible :name, :album, :release_date, :streamlink
  has_many :lyrics
end