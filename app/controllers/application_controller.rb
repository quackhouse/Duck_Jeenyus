class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user

  private
  def current_user
    @current_user ||= User.where(id: session[:current_user_id]).first
  end
end
