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
    @comments = Admin.sort_by_date
  end
  def comment_by_upvote
    @comments = Admin.sort_by_upvote
  end
  def comment_by_downvote
    @comments = Admin.sort_by_downvote
  end
end