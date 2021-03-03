
class UsersController < ApplicationController

    skip_before_action :authorized, only: [:new, :create]

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        #check if email is whitlisted
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/tasks'
        else
            render :new
        end
    end
    
    private
    def user_params
      params.require(:user).permit(:full_name, :role, :email, :discord_username, :phone, :username, :password)
    end

end