class VotesController < ApplicationController
  def create
    votes = params[:vote]
    comment_id = params[:vote][:comment_id].to_i
    comment = Comment.where(id: comment_id).first
    Vote.create(votes)
    redirect_to("/lyrics/#{comment.lyric_id}/comments/#{comment_id}")
  end
  def index
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
        :song => lyric.song
      }
    end
    @comments = @comments.sort_by { |hsh| hsh[:score] }
    @comments.reverse!
  end
end