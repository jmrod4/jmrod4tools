######################### "RUBY CONVENTION" NAMING
variable_name = 1
CONSTANT = "don't change me"
def method_name()
end
class ClassName
end
module ModuleName
end

# other naming or related

def method()
end
def method?()
end 
def method!()
end 
def method=()
end

:a_symbol  # equivalent to 'a_symbol' but inmutable
@instance_variable = 2  # "global" to an object
@@class_variable = 3    # "global" to a class
$global_variable = 5    # global to everywhere

######################## EXTRA COOL TRICKS!!

# one line conditional sentences
puts 'sure print this' if 1==1  # works as expected
1==1 || puts('sure print this')   # same but completly esoteric :)

puts 'never print this' if not (1==1) # work as expected
puts 'never print this' unless 1==1 # same but JMR find it convoluted :)

# puts (writes) a representation of the object (not just to_s)
p 'string'

# add one element to an array
a = []
a << 'trinity'  # extra cool
a.push 'neo'    # as expected
a[2] = 'mouse'  # old boring, error prone
a << 'morpheus'
p a    


# assigning default values if unassigned or nil or false variables
@var = @var || 'default_value'
@var ||= 'default_value'    # same as preceding

# get the first argument on the command line or default value
filename = ARGV[0] || 'default_filename'

# some scope limited file opening, complete with automatic close
string = 'text to save'
File.open filename, 'w' do |f|
  f.write string
end

# read the complete file
string_content = File.read filename



######################## SOME SUBTLETIES

s = '1234'
puts "Got a #{s.size} characters long string" 
puts 'Got a ' + s.length.to_s + ' characters long string' # just the same



city = 'Washington'
temp_f = 84
puts("The city is #{city} and the temp is #{5.0/9.0 * (temp_f-32)} C")
a_multiline_string = %Q{
  The city is #{city}.
  The temp is #{5.0/9.0 * (temp_f-32)} C
  }
puts a_multiline_string
puts %Q<some {parenthesis}...>

# RULE: false and nil evaluate to false, everything else evaluate to true
if 0
  puts 'zero is really true!'
end

PI_NUMBER = 3.14   # constants *can* be altered...
PI_NUMBER = 3.15   # ...but should not (and generates a warning)

p 7.class # outputs Fixnum
p 'hello'.instance_of?(String) # true
p 'hello'.nil? # false

windows_home = "#{ENV['HOMEDRIVE']}" + "#{ENV['HOMEPATH']}"
p windows_home

##################################################### BORING STUFF

############## STRINGS
puts 
puts 'STRING METHODS'
#puts "Enter any string and press enter"
#s = gets.chomp #remove trailing newline
s = "my string"
puts 'Got a ' + s.length.to_s + ' characters long string'
puts "Got a #{s.size} characters long string" #just the same
puts 'Playing with case...'
puts 'upcase = ' + s.upcase
puts 'downcase = ' + s.downcase
puts 'swapcase = ' + s.swapcase
puts 'capitalize = ' + s.capitalize
puts 'Other string methods...'
puts 'reverse = ' + s.reverse
puts 'center = ' + s.center(50)
puts 'ljust = ' + s.ljust(50)
puts 'rjust = ' + s.rjust(50)


################## NUMBERS
puts
puts 'NUMBER METHODS'
puts 5**2, 7/3, 7%3
puts 3.7.round, 3.7.truncate, -123.abs
puts 1.succ
puts "rand = #{rand}" 
puts "random between 0 and 9 = rand(10) = #{rand(10)}" 
srand 1976

puts
puts Math::PI
puts Math.cos(Math::PI/2)
puts Math.sin(Math::PI/2)
puts Math.tan(Math::PI/2)
puts Math::E
puts Math.log(Math::E**2)
puts Math.sqrt(2)

puts
puts 'COMPARISON METHODS'
puts "1>2 = #{1>2}" 
puts "1<=2 = #{1<=2}" 
puts "1==2 = #{1==2}" 
puts "1==1 = #{1==1}" 
puts " = #{}" 


############### LOGIC


puts 1==1, 1<2, 6>4, 4>=4, 1<=2
puts ((1==1) and (2==2)), (1==1) && (2==2) # && takes higher precedence than and
puts ((1==1) or (2==3)), (1==1) || (2==3) # || takes higher precedence than or
puts (not (1==2)), !(1==2)


if true or false
elsif true or false
else
end

if true || false
elsif true && !false
end

while !true
  break
  next
end

until true
end

############## ITERATORS

puts
3.times do
  puts 'ouch'
end

puts
a = ['zero', 'one', 'two']
a.each do |element|
  puts element
end

############### ARRAYS

a = ['zero', 'one', 'two']
p a
p a.sort
p a.reverse
puts a.to_s
puts a.join(', ')
puts a.join('  :)  ') + '  8)'
p [a, a]
puts 'nothing here...'
200.times do
  puts []
end
puts 'poping'
puts a.push('three')
puts a.pop
puts a.last

######### HASHES

h = {}
h = {'first_name' => 'Albert', 'last_name' => 'Einstein'}
h = {:first_name => 'Albert', :last_name => 'Einstein'} # Symbols make good hash keys, so better
p h
# more traditional...
h['first_name'] = 'Albert'
h['last_name'] = 'Einstein'
puts h['first_name'], h['last_name'] # Is Albert Einstein

######### REGULAR EXPRESSIONS

/old/ =~ 'this old house' # 5 - the index of 'old'
/Russ|Russell/ =~ 'Fred' # nil – Fred is not Russ nor Russell
/.*/ =~ 'any old string' # 0 - the RE will match anything
/old/ !~ 'this old house' # false - the regular expression matchs
/Russ|Russell/ !~ 'Fred' # true – the regular expression doesn't match


########## CLASES

class Wall
  
  def initialize(num_of_bottles)
    @bottles = num_of_bottles # instance variables
  end

=begin rdoc
Predicate, ends in a question mark, returns <b>Boolean</b>.
=end
  def empty?()              # predicate methods
    @bottles.zero? 
  end
  
  def sing_one_verse!()     # destructive methods
    puts sing(' on the wall, ') + sing("\n") + take_one_down! + sing(" on the
wall.\n\n")
  end
  
  private                   # following are private methods

  def sing(extra='')
    "#{(@bottles > 0) ? @bottles : 'no more'} #{(@bottles == 1) ? 'bottle' :
'bottles'} of beer" + extra
  end

=begin rdoc
Destructive method named with a bang because it decrements @bottles.
Returns a <b>String</b>.
=end
  def take_one_down!()
    @bottles -= 1
    'take one down, pass it around, '
  end

end







######### naming revisited

local_variable = 1      # starts lowercase (like methods)
CONSTANT = 1.1          # constant
Constant = 1.1          # same (not recommended)

@instance_variable = 2  # "global" to an object
@InstanceVariable = 2   # same (not recommended)

@@class_variable = 3    # "global" to a class
@@ClassVariable = 3     # same (not recommended)

$global_variable = 5    # global to everywhere
$GLOBAL_VARIABLE = 4    # same
$-x = "global_variable" # same
