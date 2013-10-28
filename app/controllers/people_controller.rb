class PeopleController < ApplicationController
  def new
    @person = Person.new
  end
  def create
    @person = Person.new(params[:person])
    if @person.save
      session[:current_user_id] = @person.id
      redirect_to('/')
    else
      flash[:notice] = "Failed to save. Did you enter everything correctly?"
      render :new
    end
  end
end