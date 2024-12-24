module NodeParser

  module_function
  
  def determine_node(value)
    case determine_type(value)
    when :dieroll
      Dieroll.new(value)
    when :modifier
      Modifier.new(value)
    when :named
      Named.new(value)
    when :nova
      Nova.new(value)
    when :parenthetical
      Parenthetical.new(value)
    end
  end

  def determine_type(value)
    if value =~ NodeExpressions::PARENTHETICAL_MATCH
      :parenthetical
    elsif value =~ NodeExpressions::NOVA_MATCH
      :nova
    elsif value =~ NodeExpressions::MODIFIER_MATCH
      :modifier
    elsif value =~ NodeExpressions::DIEROLL_MATCH
      :dieroll
    elsif value =~ NodeExpressions::NAMED_MATCH
      :named
    else
      raise SyntaxError
    end
  end

  class SyntaxError < StandardError
    def message
      'Do what now?'
    end
  end
  
end
