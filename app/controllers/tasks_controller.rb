# frozen_string_literal: true

class TasksController < ApplicationController

  layout "header"  #the header for the pages
  
  def index
    # Returns all tasks in order by id
    @tasks = Task.order(id: :asc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    if current_user.role != 'admin' && current_user.role != 'moderator'
      redirect_to '/tasks'
    end
  end

  def create
    if current_user.role != 'admin' && current_user.role != 'moderator'
      redirect_to '/tasks'
    end
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    if current_user.role != 'admin' && current_user.role != 'moderator'
      redirect_to '/tasks'
    end
  end

  def update
    @task = Task.find(params[:id])
    if current_user.role == 'admin' || current_user.role == 'moderator'
      if @task.update(task_params)
        redirect_to @task
      else
        render :edit
      end
    else
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :claimed_by, :child_task_id, :due_date, :task_description, :tag)
  end
end
