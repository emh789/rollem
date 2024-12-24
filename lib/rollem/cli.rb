module CLI

  module_function

  def new
    args = {}
    OptionParser.new do |parser|
      parser.banner = 'Usage: rollem [options] [roll]'
      parser.on("-nNAMESFILE", "--names=NAMESFILE", "Names file") do |n|
        args[:namesfile] = n
      end
    end.parse!

    if args[:namesfile]
      Named.import_file(args[:namesfile])
    end
        
    if ARGV.empty?
      Session.new.interact
    elsif ARGV.any?
      Session.new.cli(ARGV)

    end
  end
  
end
