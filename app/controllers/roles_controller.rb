# frozen_string_literal: true

class RolesController < ApplicationController
  def index
    # Returns all tasks in order by id
    @roles = Role.order(id: :asc)
  end

  def new
    @roles = Role.new
  end

  def show
    @roles = Role.find(params[:id])
  end

  def create
    redirect_to '/roles' if current_user.role != 'admin' && current_user.role != 'moderator'
    @roles = Role.new(role_params)
    if @roles.save
      redirect_to '/roles'
    else
      render :new
    end
  end

  def destroy
    @roles = Role.find(params[:id])
    @roles.destroy
    redirect_to @roles
  end

  def role_params
    params.require(:role).permit(:role_name)
  end
end
