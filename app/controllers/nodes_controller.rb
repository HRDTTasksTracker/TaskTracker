class NodesController < ActionController::Base
  
    attr_reader :value
    
    def initialize(value)
      @value = value
      @adjacent_nodes = []
    end
    
    def add_edge(adjacent_node)
      @adjacent_nodes << adjacent_node
    end
    
  end