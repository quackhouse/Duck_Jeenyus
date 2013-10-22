class CommentsController < ApplicationController
  def show
    lyric_id = params[:lyric_id].to_i
    @lyric = Lyric.find(lyric_id)
  end
  def new
    @comment = Comment.new
    @lyric_id = params[:lyric_id]
    lyric_id = params[:lyric_id].to_i
    @lyric = Lyric.find(lyric_id)
  end
  def create
    comment = params[:comment]
    if comment[:user_id] == nil
      comment[:user_id] = 3
    end
    lyric_id = params[:comment][:lyric_id]
    Comment.create(comment)
    redirect_to("/lyrics/#{lyric_id}")
  end
  def show
    id = params[:id].to_i
    @comment = Comment.find(id)
    if @comment.user.nil?
      @author = "Anonymous"
    else
      @author = @comment.user.name
    end
    @lyric = @comment.lyric
    @song = @lyric.song
    @vote = Vote.new
    votes_up = Vote.where(comment_id: @comment.id, user_id: session[:current_user_id], value: 1)
    @votes_up = 0
    votes_up.each do |vote|
      @votes_up += 1
    end
    @votes_down = 0
    votes_down = Vote.where(comment_id: @comment.id, user_id: session[:current_user_id], value: 0)
    votes_down.each do |vote|
      @votes_down += 1
    end
  end
  def edit
    id = params[:id].to_i
    @comment = Comment.find(id)
  end
  def update
    comment = params[:comment]
    id = params[:comment]["id"].to_i
    to_edit = Comment.find(id)
    lyric_id = params[:comment][:lyric_id]
    to_edit.update_attributes(comment)
    redirect_to("/users/#{params[:current_user_id]}/show")
  end
end