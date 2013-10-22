class Comment < ActiveRecord::Base
  attr_accessible :text, :date_created, :lyric_id, :user_id
  belongs_to :user
  belongs_to :lyric
end