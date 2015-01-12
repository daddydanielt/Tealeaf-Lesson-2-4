class SessionsController < ApplicationController

  def initializer

  end

  def new

  end

  def create
    #user = User.where(creator: params[:username]).first
    user = User.where(username: params[:username]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Hi, #{user.username}"
      redirect_to root_path
    else
      flash[:errors] = "There's something wrong with username/password!"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "881. You've logged out."
    redirect_to root_path
  end

end