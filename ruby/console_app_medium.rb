# console_app_medium
# $Id: console_app_medium.rb, v 0.1 2011/07/15
# Copyright 2011 Juan M. Rodriguez 
# You can redistribute and/or modify this software under the terms of GNU GPL v3 (or above) license

Version = '0.1'
Release = '2011/07/15'


require 'optparse'

if __FILE__ == $0
  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: #{File.basename($0)} [options] arg1"

    opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
      options[:verbose] = v
    end
    
    opts.on("-V", "--version", "Display version") do
      puts opts.version() + ' ' + opts.release
      exit
    end
    
    if ARGV.size != 1
      opts.warn('one argument required')
      exit
    end
    
  end.parse!

  p options
  p ARGV
end