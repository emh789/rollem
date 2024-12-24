class Parenthetical

  attr_accessor :components, :content, :object, :result, :value

  def initialize(value)
    @value = value
    @components = value.match NodeExpressions::PARENTHETICAL_COMPONENTS
    @content = @components[:content]
    @object = NodeParser.determine_node(@content)
    @result = "(#{@object.result})"
  end
  
  def nodes
    [@object]
  end
  
end
