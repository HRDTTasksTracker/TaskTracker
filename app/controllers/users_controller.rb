
class UsersController < ApplicationController
    def show
        @user = User.find(params[:username])
      end
    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user
        else
            render :new
        end
    end
    
    private
    def user_params
      params.permit(:full_name, :role, :email, :discord_username, :phone, :username, :password)
    end

end