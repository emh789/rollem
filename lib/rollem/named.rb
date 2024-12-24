class Named

  @@names = {}

  def self.import_file(filename)
    @@names = Psych.safe_load(File.read(filename))
  end
      
  class NamedRollNotFound < StandardError
    def initialize(key)
      @key = key
    end
    def message
      "Named roll '#{@key}' not found."
    end
  end

  class NamedRollHasOptions < StandardError
    def initialize(components, value)
      @components = components
      @options = value
    end
    def message
      "Named roll '#{@components}' has options: #{@options}."
    end
  end
  
  attr_accessor :key, :value, :object, :result, :statement

  def initialize(value)
    @key = value
    @value = determine_named_value
    if value == nil
      raise NamedRollNotFound.new(@key)
    end
    @object = NodeParser.determine_node(@value)
    @result = "(#{@object.result})"
  end

  def determine_named_value
    components = @key.split('.')
    value = @@names.dig(*components)
    case value
    when String
      value
    when Hash
      raise NamedRollHasOptions.new(@key, value)
    when nil
      raise NamedRollNotFound.new(@key)
    end
  end
  

end
