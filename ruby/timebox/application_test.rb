# application_test.rb
# Copyright 2011 Juan M. Rodriguez 
# You can redistribute and/or modify this software under the terms of GNU GPL v3 (or above) license

Version = '0.1'
Release = '2011/07/17'

require './application'
require 'optparse'

if __FILE__ == $0

  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: #{program_name} [options] arg1"
    #options already included: -h --help, -v --version
  end.parse!
  if ARGV.size != 1
    abort('one argument required, use -h for help')
  end
  p options
  p ARGV
  
end