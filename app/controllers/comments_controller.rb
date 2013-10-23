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
    @votes_up = @comment.votes_up(session[:current_user_id])
    @votes_down = @comment.votes_down(session[:current_user_id])
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
  def destroy
    id = params[:id].to_i
    comment = Comment.find(id)
    comment.destroy
    redirect_to("/users/#{session[:current_user_id]}")
  end
end