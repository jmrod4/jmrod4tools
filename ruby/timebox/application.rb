

def program_name
  (@program_name || File.basename($0, '.*'))
end

def warn(msg = $!)
  super("#{program_name}: Warning - #{msg}")
end
  
def abort(msg = $!)
  super("#{program_name}: ABORT - #{msg}")
end

######################################### SIMPLE BUT NEAT INTERACT

def softline_puts(line)
  print "\r" + line.to_s
end

def softline_delete
  print "\r" + ' '*77 + "\r"
end

def prompt(msg = '>')
  print msg + ' '
  $stdin.gets
end

def presskey
  prompt "Press ENTER to continue..."
end


######################################### CONFIGURATION SAVING

require 'yaml'

def data_load(filename)
  begin
    data = YAML.load_file(filename)
  rescue
    warn("loading data: #{$!}")
    data = nil
  end
  data
end

def data_save(filename, data)
  File.open(filename , "w" ) do |io|
    io.write(YAML.dump(data))
  end
end

def beep
  print 7.chr
  #print "\a"
end


########################################### MISCELANEA

class String
  def plural(number)
    (number >= 2)? self + 's' : self
  end
end
