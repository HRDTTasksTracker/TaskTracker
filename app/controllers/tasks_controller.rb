require 'Graph.rb'
class TasksController < ApplicationController
  def index
    # Returns all tasks in order by id
    @tasks = Task.order(id: :asc)
    @nodes = Node.order(id: :asc)
    @graph = Graph.new
    @nodes.each do |row|
     # @graph.add_node(row.id)
    end

      

  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      @node = Node.new(node_params)
      @node.update(adjacent_nodes: [@task.child_task_id])
      @node.save
      redirect_to @task
      
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
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
    def node_params
      params.require(:task).permit(:task_name)
    end
    def node_params1
      params.require(:node).permit(:task_name)
    end

end
