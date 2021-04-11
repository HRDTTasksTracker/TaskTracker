# frozen_string_literal: true

class TasksController < ApplicationController

  layout "header"  #the header for the pages
  
  def index
    # Returns all tasks in order by id

    @tasks = Task.order(id: :asc)   #Returns all nodes stored in the nodes table
    @nodes = Node.order(id: :asc)
    @graph = Graph.new          #new graph tree created
    @nodes.each do |row|
      @graph.add_node(row)      #adding the node to graph


    end

    #now graph object contains all the nodes( task name , child task id) within the object.  

      


  end

  def filtered
    # this is the task that have been filterd by the users input
    @tasks = Task.where(tag: params[:tagsearch])

    # if noting was entered, then just reload the /tasks page
    if params[:tagsearch] == ""
      redirect_to '/tasks'
      return
    end

    # if nothing returned on a search, then display error message and redirect to /tasks
    if Task.where(tag: params[:tagsearch]).count == 0
      render(
        html: "<script>alert('Nothing Found');
          window.location.replace(\"/tasks\")</script>".html_safe,
      )
    end
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
