# frozen_string_literal: true

class SessionsController < ApplicationController
  # ensures the authorized function in the applicationController
  # does not run when trying to create an account or sign in
  skip_before_action :authorized, only: %i[new create welcome]

  # creates a new session then sets the current user id to
  # the current user
  def create
    @user = User.find_by(username: params[:username])
    # if @user && @user.authenticate(params[:password])
    if @user && @user.password == (params[:password])
      session[:user_id] = @user.id
      redirect_to '/tasks'
    else
      redirect_to '/login'
    end
  end

  def new
    redirect_to '/tasks' if logged_in?
  end

  def page_requires_login; end

  def login
    redirect_to '/tasks' if logged_in?
  end

  def welcome
    redirect_to '/tasks' if logged_in?
  end

  def logout
    session[:user_id] = -1
  end
end
