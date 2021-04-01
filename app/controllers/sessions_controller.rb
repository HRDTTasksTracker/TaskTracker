class SessionsController < ApplicationController
  #ensures the authorized function in the applicationController
  #does not run when trying to create an account or sign in
  skip_before_action :authorized, only: [:new, :create, :welcome]

  #creates a new session then sets the current user id to
  #the current user
  def create
    @user = User.find_by(username: params[:username])
    #if @user && @user.authenticate(params[:password])
    if @user && @user.password == (params[:password])
       session[:user_id] = @user.id
       redirect_to '/tasks'
    else
       redirect_to '/login'
    end
  end

  def new 
  end

  def page_requires_login
  end

  def login
    if logged_in?
      redirect_to '/tasks'
    end
  end

  def welcome
    if logged_in?
      redirect_to '/tasks'
    end
  end

  def logout
    session[:user_id] = -1
  end

end
