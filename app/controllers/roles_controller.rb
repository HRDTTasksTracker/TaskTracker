class RolesController < ApplicationController
    def index
        # Returns all tasks in order by id
        @roles = Role.order(id: :asc)
    end
    def new
        @roles = Role.new
    end
    def create
        @roles = Role.new(role_params)
        if @roles.save
          redirect_to @roles
        else
          render :new
        end
    end

    def role_params
        params.require(:roles).permit(:role_name)
    end
end