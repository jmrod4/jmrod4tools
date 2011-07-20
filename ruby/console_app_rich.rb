#!/usr/bin/ruby
=begin
---------------------------------------------------------------------

    someapp - some other app

    Copyright (C) 2009 Juan M. Rodriguez

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

---------------------------------------------------------------------
=end


DESCRIPTION = <<HERE_DESCRIPTION
    A timer program that reads an input_file and executes the timer commands
    (ie. show the corresponding messages at their correct times).
HERE_DESCRIPTION


=begin
---------------------------------------------------------------------
INTERFACE


---------------------------------------------------------------------
DESIGN


---------------------------------------------------------------------
HISTORY

    2009-09-12 First draft.

---------------------------------------------------------------------
=end

Version = '0.0.1'
Release = '2009-09-12'



## ----------------------------------------------
## APPLICATION PARSING

require 'optparse'
require 'ostruct'

class Application < OptionParser
    attr_reader :options

    class TooMuchArguments < ParseError
        const_set(:Reason, 'too much arguments'.freeze)
    end

    def initialize
        @options = OpenStruct.new           #empty options
        ## set defaults
        #@options.someoption = "default value"

        ## program_name() and ver() are defined in the parent class 
        help_text = <<HELP_TEXT
#{ver} - Copyright (C) 2009 Juan M. Rodriguez.
Licensed under GNU GPL version 3 or (at your option) any later version.

#{DESCRIPTION}
    Usage: #{program_name} [options] input_file

Common options:
  -h, --help; -v, --version; --
Specific options:
HELP_TEXT

        ## call parent.initialize
        super(banner=help_text, width=20, indent='  ')

        ##EXAMPLES
        #on_tail("-H", "--help_format", "show input file format") do
        #   puts INPUT_FILE_FORMAT
        #   exit
        #end
    end
    
    ## sidefect: modifies argv!!
    def parse_required_arg(arg_description, argv)
        raise MissingArgument, arg_description if argv.empty?
        value = argv.shift
    end
    
    ## sidefect: modifies args (args=ARGV if not specified)
    def parse!(*args)
        ## sidefect: modifies args!!
        argv = super(*args)
        
        ##EXAMPLES
        ### sidefect: modifies args!!
        #@options.inputfile = parse_required_arg("input filename", argv)
        
        raise TooMuchArguments, argv if not argv.empty?
        argv
    end
end



## ----------------------------------------------
## FUNCTIONS






## ----------------------------------------------
## DO-PARSING

## parse command line
app = Application.new
begin
    ## sidefect: modifies ARGV!!
    app.parse!
rescue
    app.abort
end
##Testing parsing...
#puts "Options:", app.options



## ----------------------------------------------
## DO-MAIN

puts "Done."





