class Lyric < ActiveRecord::Base
  belongs_to :song
  has_many :comments

  def sort_comments
    comments = self.comments
    @comments = []
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
      @comments << {
        :comment_id => comment.id,
        :comment_text => comment.text,
        :upvotes => upvotes,
        :downvotes => downvotes,
        :score => score
      }
    end
    @comments = @comments.sort_by { |hsh| hsh[:score] }
    @comments.reverse!
  end
end