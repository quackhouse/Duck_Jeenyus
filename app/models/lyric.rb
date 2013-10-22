class Lyric < ActiveRecord::Base
  belongs_to :song
  has_many :comments
end