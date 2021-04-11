class RolesController < ApplicationController
    layout "header"  #the header for the pages
    def index
        # Returns all roles in order by id
        @role = Role.order(id: :asc)
      end
    def new
        @role = Role.new
    end
    def create
        @role = Role.new(role_params)
        if @role.save
          redirect_to @role
        else
          render :new
        end
    end

    def role_params
        params.require(:role).permit(:role_name)
    end
end