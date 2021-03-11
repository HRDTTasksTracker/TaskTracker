
class UsersController < ApplicationController

    skip_before_action :authorized, only: [:new, :create]

    #shows all users
    def index
        @users = User.all.order(id: :asc)
    end

    #shows a particular user with id: id
    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end
    
    #creates a new user after form is filled out
    #ensures the user has an email that has been whitelisted
    #the first user to be created does not
    #require a whitelisted email
    def create
        @badEmail = false
        @user = User.new(user_params)
        #check if there are currently any users
        @search = User.first
        #check if email is whitlisted
        @valid_email = ValidEmail.find_by(email: @user.email)
        if (@valid_email != nil && @valid_email.in_use != true) || @search.blank? == true
            if @user.save
                #if this is the first user being made, then
                #add their email to the whitelist of emails
                #and set in_use to true and email to user email, then save
                if @valid_email == nil
                    @valid_email = ValidEmail.new
                    @valid_email.email = @user.email
                    @valid_email.in_use = true
                    @valid_email.save
                end
                #if user already is whitelisted, then
                #just set in_use to true, then update
                session[:user_id] = @user.id
                @valid_email.in_use = true
                @valid_email.update(email: @valid_email.email, in_use: true)
                redirect_to '/tasks'
            else
                render :new
            end
        else
            @badEmail = true
            render :new
        end
    end

    #user can edit users, but this guarentees the user can only
    #edit their own information
    def edit
        @user = User.find(params[:id])
        if @user.id != session[:user_id]
            redirect_to '/users'
        end
    end

    #same protections as edit to have double protection
    def update
        @user = User.find(params[:id])
        if @user.id == session[:user_id]
            if @user.update(user_params)
                redirect_to '/tasks'
            else
                render :new
            end
        else
            render :new
        end
    end
    
    private
    def user_params
      params.require(:user).permit(:full_name, :role, :email, :discord_username, :phone, :username, :password)
    end

end