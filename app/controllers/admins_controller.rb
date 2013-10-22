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
    render :new
   end
  end
  def logout
    session[:admin] = false
    redirect_to('/')
  end
  def songs
    @songs = Song.all
  end
  def comments

  end
end