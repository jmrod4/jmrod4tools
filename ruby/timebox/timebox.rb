# timebox.rb
# Copyright 2011 Juan M. Rodriguez 
# You can redistribute and/or modify this software under the terms of GNU GPL v3 (or above) license

Version = '0.2'
Release = '2011/07/21'

require './application'
require 'optparse'
require 'yaml'
require './time_block'
require './time_stack'
require './stack_list'

DEFAULT_DATAFILE = "#{program_name}.yml"

Description = <<HERE_DESCRIPTION
Count backwards a series of time intervals it reads from the files specified,
or from #{DEFAULT_DATAFILE} if none specified.
HERE_DESCRIPTION


def example_data
  data = StackList.new
  stack = TimeStack.new("Ejemplo de stack de 3 minutos")
  stack.add_block(TimeBlock.new("Primer bloque de 1 minuto", 1))
  stack.add_block(TimeBlock.new("Segundo bloque de 2 minutos", 2))
  data.add_stack(stack)
  stack = TimeStack.new("Ejemplo de stack de 5 minutos")
  stack.add_block(TimeBlock.new("Primer bloque de 4 minutos", 4))
  stack.add_block(TimeBlock.new("Segundo bloque de 1 minuto", 1))
  data.add_stack(stack)
  data
end


if __FILE__ == $0
    
  ########################################## PROCESS OPTIONS
  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: #{program_name} [options] [datafile.yml] [...]\n\n#{Description}\n"
    #options already included: -h --help, -v --version
    opts.on("-x", "--example", "Prints a datafile example") do
      puts YAML.dump(example_data)
      exit
    end
  end.parse!
  options[:file_list] = ((ARGV.size > 0)? ARGV : [DEFAULT_DATAFILE])
  p options
  p ARGV

  ###################################### RUN STACKS (of time intervals)
  options[:file_list].each do |file_name|
    stack_list = YAML.load_file(file_name)
    stack_list.each_stack do |stack|
      puts stack.title
      prompt("Press ENTER to continue...")
      stack.each_block do |block|
        block.run
      end #block
    end #stack
  end #file_name
    
end