class Comment < ActiveRecord::Base
  attr_accessible :text, :date_created, :lyric_id, :user_id
  belongs_to :user
  belongs_to :lyric

  def votes_up(user_id)
    all_votes_up = Vote.where(comment_id: self.id, user_id: user_id, value: 1)
    votes_up = 0
    all_votes_up.each do |vote|
      votes_up += 1
    end
    votes_up
  end
  def votes_down(user_id)
    votes_down = 0
    all_votes_down = Vote.where(comment_id: self.id, user_id: user_id, value: 0)
    all_votes_down.each do |vote|
      votes_down += 1
    end
    votes_down
  end
end