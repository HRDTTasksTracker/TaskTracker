class Graph
  def initialize
    @vertices = {}
  end
    
  def add_node(@vertex)
    @vertices << @vertex
  end
    
  def add_edge(node1, node2)
    @nodes[node1].add_edge(@nodes[node2])
    @nodes[node2].add_edge(@nodes[node1])
  end
    
end