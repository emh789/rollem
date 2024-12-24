module NodeExpressions

  # Separate a dieroll into its components
  DIEROLL_COMPONENTS = /
    \A
      (?<operator>[\*\/\+\-]?)
      (?<diecount>[0-9]*)
      d(?<diemax>[0-9]+)
    \z
  /x

  # Match a standalone dieroll
  DIEROLL_MATCH = /  
    \A
      [\*\/\+\-]?
      [0-9]?
      d[0-9]+
    \z
  /x
   
  # Match a standalone modifier
  MODIFIER_MATCH = /
    \A
      [\*\/\+\-]?
      [0-9]+
    \z
  /x
    
  # Match a standalone named statement
  NAMED_MATCH = /
    \A
      [A-Za-z\.]+
    \z
  /x
  
  # The presence of an operator will indicate a Nova
  # and the nodes of the Nova will be determined later
  NOVA_MATCH = /
    [\d\w]+       # something
    [\+\-\*\/]    # operator
    [\d\w]+       # something
  /x
  
  # Separate the possible nodes of a Nova
  NOVA_SCAN = /
    \([\w\d\(\)\*\/\+\-]+\) |  # parenthetical, or
    [\*\/\+\-]?\d?[d]\d+    |  # dieroll, or
    [\*\/\+\-]?[\w\.]+      |  # named, or
    [\*\/\+\-]?\d+             # modifier
  /x
  
  # Separate the contents of a parenthetical statement
  PARENTHETICAL_COMPONENTS = /
    \A
      \(
      (?<content>[\w\d\(\)\*\/\+\-]+)
      \)
    \z
  /x
  
  # Match a standalone parenthetical statement
  PARENTHETICAL_MATCH = /
    \A
      \(
      [\w\d\(\)\*\/\+\-]+
      \)
    \z
  /x

end
