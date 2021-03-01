class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def create
    @user = User.find_by(username: params[:username])
    #if @user && @user.authenticate(params[:password])
    if @user && @user.password == (params[:password])
       sessions[:user_id] = @user.id
       redirect_to '/welcome'
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

end
