class Log

  def initialize
    @indent = 0
    @interval = 2
  end
    
  public
  
  def display(node)
    case node
    when Dieroll
      display_dieroll(node)
    when Modifier
       display_modifier(node)
    when Named
      display_named(node)
    when Nova
       display_nova(node)
    when Parenthetical
       display_parenthetical(node)
    end
  end
  
  def display_dieroll(dieroll)
    indent_increase do
      puts "#{margin}Dieroll: #{dieroll.components} #{dieroll.array} = #{dieroll.result}"
    end
  end
  
  def display_modifier(modifier)
    indent_increase do
      puts "#{margin}Modifier: #{modifier.result}"
    end
  end
  
  def display_named(named)
    indent_increase do
      puts "#{margin}#{named.key}: #{named.value} = #{named.result}"
      named.object.nodes.each { |n| display n }
    end
  end
  
  def display_nova(nova)
    indent_increase do 
      puts "#{margin}Nova: #{nova.components} = #{nova.values}"
      nova.nodes.each { |n| display n }
    end
  end
  
  def display_parenthetical(parenthetical)
    parenthetical.object.nodes.each { |n| display n }
  end
  
  def indent_increase
    @indent = @indent + 1
    yield
    @indent = @indent - 1
  end
  
  def margin
    " " * @interval * @indent
  end
  
  def trace_and_total(roll)
    display(roll.nodes)
    total(roll)
  end
  
  def total(roll)
    puts "Total: #{roll.total}"
  end
  
end
