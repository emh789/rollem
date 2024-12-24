class Nova

  attr_accessor :components, :nodes, :result

  def initialize(value)
    @components = value.scan NodeExpressions::NOVA_SCAN
    @nodes = @components.map { |c| NodeParser.determine_node(c) }
    @result = @nodes.map { |n| n.result }.join
  end

  public
  
  def values
    @nodes.map { |n| n.result.to_s }.join
  end
    
end
