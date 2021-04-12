# frozen_string_literal: true

# :nodoc:
class ApplicationController < ActionController::Base
  # the function authorized will run before
  # any action in any controller
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  before_action :set_cache_headers

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  # makes sure user is logged in
  # this will not run when trying to make a new user or signin
  def authorized
    redirect_to '/welcome' unless logged_in?
  end

  def set_cache_headers
    response.headers['Cache-Control'] = 'no-cache, no-store'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Mon, 01 Jan 1990 00:00:00 GMT'
  end
end
