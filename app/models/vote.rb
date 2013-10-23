class Vote < ActiveRecord::Base
  attr_accessible :user_id, :value, :comment_id, :date_created

  belongs_to :user
  belongs_to :comment

  def self.sort_comments
    @comments = []
    comments = Comment.all
    comments.each do |comment|
      votes_up = Vote.where(comment_id: comment.id, value: 1)
      upvotes = 0
      votes_up.each do |vote|
        upvotes += 1
      end
      votes_down = Vote.where(comment_id: comment.id, value: 0)
      downvotes = 0
      votes_down.each do |vote|
        downvotes += 1
      end
      score = upvotes - downvotes
      lyric = Lyric.find(comment.lyric_id)
      lyric_id = lyric.id
      @comments << {
        :comment_id => comment.id,
        :comment_text => comment.text,
        :upvotes => upvotes,
        :downvotes => downvotes,
        :score => score,
        :lyric_id => lyric_id,
        :song => lyric.song,
        :lyric => lyric.text
      }
    end
    @comments = @comments.sort_by { |hsh| hsh[:score] }
    @comments.reverse!
  end
end