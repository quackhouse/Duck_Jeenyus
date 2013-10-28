class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show

  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      @current_user = @user
      session[:current_user_id] = @user.id
      redirect_to('/')
    else
      # go to users/new.html.erb and just display that page.
      # in this action
      render :new
    end
  end
  def login

  end
  def login_do
    email = params[:email]
    password = params[:password]
    @user = User.where(email: email).first
    if @user && @user.authenticate(password)
      session[:current_user_id] = @user.id
      # redirect_to("/users/#{user.id}")
      redirect_to('/')
    else
      flash[:notice] = "Sorry, that information is not correct."
      render :login
    end

  end

end