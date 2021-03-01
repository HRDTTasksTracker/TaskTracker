class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

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
  end

  def logout
    session[:user_id] = -1
  end

end
