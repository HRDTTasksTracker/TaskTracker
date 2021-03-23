class TasksController < ApplicationController
  def index
    # Returns all tasks in order by id
    @tasks = Task.order(id: :asc)   #Returns all nodes stored in the nodes table
    @nodes = Node.order(id: :asc)
    @graph = Graph.new  #new graph tree created
    @nodes.each do |row|
      @graph.add_node(row)      #adding the node to graph


    end

    #now graph object contains all the nodes( task name , child task id) within the object.  

      

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
  
    class Graph
      def initialize
        @vertices = {}
      end
        
      def add_node(vertex)
        @vertices[vertex] = vertex
      end
        
      def add_edge(node1, node2)
        @vertices[node1].update(adjacent_nodes: node2.id)
        @vertices[node2].add_edge(@nodes[node1])
      end
        
    end

end
