class Modifier

  attr_accessor :result

  def initialize(value)
    @result = value.to_s
  end

  public
  
  def nodes
    [@result]
  end
    
  def value
    @result
  end
    
end
