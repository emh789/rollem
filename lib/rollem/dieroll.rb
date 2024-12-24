class Dieroll

  attr_accessor :array, :components, :diecount, :diemax, :operator, :result, :value

  def initialize(component)
    @value = component
    @components = component.match NodeExpressions::DIEROLL_COMPONENTS
    @operator = @components[:operator]
    @diecount = (@components[:diecount].to_s == '' ? 1 : @components[:diecount]).to_i
    @diemax = @components[:diemax].to_i
    @array = @diecount.times.map { rand(@diemax).to_i + 1 }
    @result = [@operator, array.sum].map { |x| x.to_s }.join
  end
  
  def nodes
    [self]
  end

end
