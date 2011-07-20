# console_app_simple
# $Id: console_app_simple.rb, v 0.1 2011/07/15
# Copyright 2011 Juan M. Rodriguez 
# You can redistribute and/or modify this software under the terms of GNU GPL v3 (or above) license

def check_usage
  unless ARGV.length == 2
    puts "Usage: #{$0} arg1 arg2"
    exit
end

if __FILE__ == $0
  check_usage
end