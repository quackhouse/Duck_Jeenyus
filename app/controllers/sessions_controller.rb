class SessionsController < ApplicationController
  def create
    access_token = request.env['omniauth.auth'][:extra][:access_token].token
    access_token = access_token.to_s

    if User.exists?(:access_token => access_token)
      user = User.where(access_token: access_token).first
      session[:current_user_id] = user.id
      redirect_to('/')
    else
      user = User.new
      user.access_token = access_token
      user.name = request.env['omniauth.auth'][:info][:name]
      user.location = request.env['omniauth.auth'][:info][:location]
      user.save
      session[:current_user_id] = user.id
      redirect_to('/')
    end

  end
  def destroy
    session[:current_user_id] = nil
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
      flash[:notice] = "nope that didn't work"
      render :new
    end
  end
end