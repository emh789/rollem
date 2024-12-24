module Rollem

  %w( cli
      dieroll
      log
      modifier
      named
      node_expressions
      node_parser
      nova
      parenthetical
      roll
      session
    ).each { |asset| require_relative File.join('rollem', asset) }

  %w( colorized_string
      optparse
      psych
      tty-prompt
    ).each { |gem| require gem }
          
end
