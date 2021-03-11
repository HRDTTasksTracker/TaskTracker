class ApplicationController < ActionController::Base
    #the function authorized will run before
    #any action in any controller
    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?

    def current_user    
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    #makes sure user is logged in
    #this will not run when trying to make a new user or signin
    def authorized
        redirect_to '/welcome' unless logged_in?
    end
end
