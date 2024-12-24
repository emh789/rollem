class Roll

  attr_accessor :input, :nodes

  def initialize(input)
    @input = input
    @nodes = NodeParser.determine_node(input)
  end

  def total
    eval @nodes.result
  end
    
end
