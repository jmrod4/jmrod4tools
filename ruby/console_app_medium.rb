# console_app_medium - skeleton for shell application, medium complexity
# Copyright 2011-2013 Juan M. Rodriguez
#
# You can redistribute and/or modify this software under the terms of GNU GPL v3 (or above) license
#
# Changelog
# ---------
# 0.1 - Initial version.
# 0.2 - Make it more the ruby way (following optparse library example)

Version = '0.2'
Release = '2013/02/18'


require 'optparse'


=begin
usage example:
  options = MyOptions.parse!(ARGV)
=end
class MyOptions

  # class method, invoke with MyOptions.parse!
  def self.parse!(args)
    options = {}
    
    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: #{File.basename($0)} [options] arg1"

      opts.on("-d", "--[no-]debug", "Run in debug mode") do |d|
        options[:debug] = d
      end
    
      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options[:verbose] = v
      end
    
      opts.on("-V", "--version", "Display version") do
        puts opts.version() + ' ' + opts.release
        exit
      end
  
    end
    
    opt_parser.parse!(args)

    if args.size != 1
      opt_parser.warn('one argument required')
      exit
    end
    
    options
  end

end


options = MyOptions.parse!(ARGV)

if options[:debug]
  print "Options: "
  p options
  print "Arguments: "
  p ARGV
end
