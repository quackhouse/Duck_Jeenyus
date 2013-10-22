class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end
  def login

  end
  def create
    admin = Admin.new(params[:admin])
    if admin.save
      session[:admin] = true
      redirect_to('/admins')
    else
      flash[:notice] = 'this shit does not work'
      render :login
    end
  end
  def logout
    session[:admin] = false
    redirect_to('/')
  end
  def admin_create
    email = params[:email]
    password = params[:password]
    @admin = Admin.where(email: email).first
    if @admin && @admin.authenticate(password)
      session[:admin] = true
      redirect_to('/admins')
    else
      flash[:notice] = "Incorrect password"
      render :login
    end
  end
  def songs
    @songs = Song.all
  end
  def comments
  end
  def comment_by_date
    @comments = Comment.all
    @comments.sort_by! { |k| k[:date_created]}
  end
  def comment_by_upvote
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
        :comment_date => comment.date_created,
        :upvotes => upvotes,
        :downvotes => downvotes,
        :score => score,
        :lyric_id => lyric_id,
        :song => lyric.song,
        :lyric => lyric.text
      }
    end
    @comments.sort_by! { |k| k[:score]}
    @comments.reverse!
  end
  def comment_by_downvote
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
        :comment_date => comment.date_created,
        :upvotes => upvotes,
        :downvotes => downvotes,
        :score => score,
        :lyric_id => lyric_id,
        :song => lyric.song,
        :lyric => lyric.text
      }
    end
    @comments.sort_by! { |k| k[:score]}
  end
end