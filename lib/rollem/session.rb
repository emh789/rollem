class Session
  
  def initialize
    @colors = {
      error:  :light_red,
      prompt: :green,
      result: :yellow,
      trace:  :white
    }
    @trace = :full
  end
  
  def cli(roll_array)
    roll_array.each do |roll|
      puts "Roll: #{roll}"
      process_roll(roll)
    end
  end
  
  def interact
    prompt = TTY::Prompt.new(enable_color: false, interrupt: -> { puts "\n"; exit} )
    loop do
      roll = prompt.ask "Roll:"
      process_roll(roll)
    end
  end

  def process_roll(input)
    begin
      roll = Roll.new(input)
      Log.new.trace_and_total(roll)
    rescue Named::NamedRollHasOptions => e
      puts e.message
    rescue Named::NamedRollNotFound => e
      puts e.message
    rescue NodeParser::SyntaxError => e
      puts e.message
    end
  end

end

