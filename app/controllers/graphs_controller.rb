class GraphsController < ApplicationController
  
    def initialize
      @nodes = {}
    end
    
    def add_node(node)
      @nodes[node.value] = node
    end
    
    def add_edge(node1, node2)
      @nodes[node1].add_edge(@nodes[node2])
      @nodes[node2].add_edge(@nodes[node1])
    end
    
  end