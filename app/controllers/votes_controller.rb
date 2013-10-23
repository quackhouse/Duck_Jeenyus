class VotesController < ApplicationController
  def create
    votes = params[:vote]
    comment_id = params[:vote][:comment_id].to_i
    comment = Comment.where(id: comment_id).first
    Vote.create(votes)
    redirect_to("/lyrics/#{comment.lyric_id}/comments/#{comment_id}")
  end
  def index
    @comments = Vote.sort_comments
  end
end