=begin
something.rb - short description

Copyright (c) 2011 Juan Manuel Rodriguez Ibañez

You can redistribute and/or modify this software under the terms of the license GNU GPL v3 or later.

=== Content / Description / Purpose
Long description probably stating purpose and/or objective in writing the code.

=== Sources / Bibliography: 
* Surname, Name 2010. "Title" City: Editorial-Company

=== Example / Interface



=end

=begin
=== Design

=end


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
puts 'sure print this' if 1==1      # works as expected
puts 'sure print this' unless 1==2  # a bit convoluted
1==1 && puts('sure print this')     # same but completly esoteric :)
1==2 || puts('sure print this')     # same but completly esoteric :)

puts 'never print this' if 1==2     # work as expected
puts 'never print this' unless 1==1 # same but JMR find it convoluted :)
1==2 && puts('never print this')    # same but completly esoteric :)
1==1 || puts('never print this')    # same but completly esoteric :)

# puts (writes) a representation of the object (not just to_s)
p 'string'
puts 'string'.inspect   # equivalent

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

p [1, 2, 3]             # just the same :) but returns the array
puts [1, 2, 3].inspect  # just the same :) but returns nil


# NON-STANDARD / MULTILINE QUOTES
city = 'Washington'
temp_f = 84
a_multiline_string = %Q{
  The city is #{city}.
  The temp is #{5.0/9.0 * (temp_f-32)} C
  }
a_multiline_string
%Q<some {(parenthesis)} or [\<brackets\>] as delimiters...>
%Q#any character as delimiter...#
%/an alternative #{"way"}.../
%q/and the 'single quotes' version don't interpret \t .../

%w( this is an array of strings ) # returns an array of strings (words)

%q/ /   # single-quoted
%Q/ /   # double-quoted
%/ /    # double-quoted
%w/ /   # array
%W/ /   # array double-quoted
%r| |   # regular expression
%s/ /   # symbol
%x/ /   # operating system command

p %q/dog cat #{1+2}/ #=> "dog cat \#{1+2}"
p %Q/dog cat #{1+2}/ #=> "dog cat 3"
p %/dog cat #{1+2}/ #=> "dog cat 3"
p %w/dog cat #{1+2}/ #=> ["dog", "cat", "\#{1+2}"]
p %W/dog cat #{1+2}/ #=> ["dog", "cat", "3"]
p %r|^[a-z]*$| #=> /^[a-z]*$/
p %s/dog/ #=> :dog
p %x/vol/ #=> " Volume in drive C is OS [etc...]"

# EXECUTING COMMANDS

puts(`dir`)
puts(%x/dir/)
puts(%x{dir})

Dir.entries( 'C:\\' ) # returns an array of files in C:\
Dir.entries( 'C:/' )  # same

print( "Goodbye #{%x{calc}}" ) # string is printed *after* the command

# GET INFORMATION FROM OBJECTS
o = 'c'       # => "c"
o.class       # => String
o.inspect     # => "\"c\""
o.object_id   # => 23424948

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

s = "Hello " << "world"
s = "Hello " + "world"
s = "Hello " "world"
s = s << 32       # add a character using ASCII code (space = 32)
s = s << 65       # add a character using ASCII code (a = 65)
s = s << 65.to_s  # add a "65" string

i = 0
begin
s = "[" << i << ":" << i.to_s << "]"
puts(s)
i += 1
end until i == 126

s = "Hello world"
s[0, 2]     # => "He"
s[0..1]     # => "He"

s[1, 3]     # => "ell"
s[1..3]     # => "ell"
s[4, 3]     # => "o w"
s[4..6]     # => "o w"

s[-1, 1]    # => "d"
s[-1, 3]    # => "d"
s[-3, 3]    # => "rld"
s[-3..-1]   # => "rld"

s[2]    # works differently in ruby 1.8 and 1.9
s[2,1]  # equivalent and works the same in 1.8 and 1.9


# non-destructive methods
s = "Hello world"
s.length      # => 11
s.size        # => 11
s.reverse     # => "dlrow olleH"
s.upcase      # => "HELLO WORLD"
s.capitalize  # => "Hello world"
s.swapcase    # => "hELLO WORLD"
s.downcase    # => "hello world"
s.squeeze     # => "Helo world"
s.split       # => ["Hello", "world"]
s.center(20)  # => "    Hello world     "
s.ljust(20)   # => "Hello world         "
s.rjust(20)   # => "         Hello world"
s.sub('world', 'home')    # => "Hello home"
s.gsub('o', '<o>')        # => "Hell<o> w<o>rld"
s             # => "Hello world"


puts "The record separator is " + $/.inspect
"line".chomp      # => "line"
"line\n".chomp    # => "line"
"line\r\n".chomp  # => "line"
"line".chop       # => "lin"
"line\n".chop     # => "line"
"line\r\n".chop   # => "line"

"line".chomp('in') # => "line"
"line".chomp('ne') # => "li"

# destructive methods
s = "Hello world"
s.insert(2, "X X")   
s             # => "HeX Xllo world"
s.reverse!
s             # => "dlrow ollX XeH"

# sprintf formats 
#   %d – decimal number
#   %f – floating-point number
#   %o – octal number
#   %p – inspect object
#   %s – string
#   %x – hexadecimal number

# regular expressions
x = "This is a test"
puts x.sub(/^../, 'Hello')  # begin line   => 'Hellois is a test'
puts x.sub(/..$/, 'Hello')  # end line     => 'This is a teHello'
puts x.sub(/\A../, 'Hello') # begin string => 'Hellois is a test'
puts x.sub(/..\Z/, 'Hello') # end string   => 'This is a teHello'

"xyz".scan(/./)             # => ["x", "y", "z"]
"xyz".scan(/./) { |letter| puts letter }

"Short sentence. Another. No more.".split(/\./).inspect
                            # => ["Short sentence", " Another", " No more"]

# match is more powerful than =~

puts "String has vowels" if "This is a test".match(/[aeiou]/)

x = "This is a test".match(/(\w+) (\w+)/)
puts x[0]   # whole match         <= This is
puts x[1]   # first parenthesis   <= This
puts x[2]   # second parenthesis  <= is

puts ?x # => ASCII code of character x
puts 120.chr # => character corresponding to 120 ASCII code


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

1.upto(5) { puts 'ouch' }
10.downto(5) { puts 'ouch' }
0.step(50, 5) { puts 'ouch' }

1.upto(5) { |n| puts n }
10.downto(5) { |n| puts n }
0.step(50, 5) { |n| puts n }

a = ['zero', 'one', 'two']
a.each do |element|
  puts element
end

############### ARRAYS

a = ['zero', 'one', 'two']
a = 'zero', 'one', 'two'    # equivalent less conventional form
b = 'this', 1, 'also', 3.14, 'works'  # another array
p a
p a.sort
p a.reverse
a.to_s                     # => ["zero", "one", "two"]
a.inspect                  # => ["zero", "one", "two"]
a.join                     # => zeroonetwo
a.join(', ')               # => zero, one, two
a.join('  :)  ') + '  8)'  # => zero  :)  one  :)  two  8)
p [a, a]

# you can convert the array elements with collect
# note: map functionality is equivalent to collect
a.collect { |element| element + '!' }            # => ["zero!", "one!", "two!"]
[1, 2, 3, 4].collect { |element| element * 2 }   # => [2, 4, 6, 8] 

puts 'nothing here...'
200.times do
  puts []
end

puts 'poping'
puts a.push('three')
puts a.pop
puts a.last

x = [1, 2, 3, 4, 5]
y = [1, 2, 3]
z = x - y
# x - y 
# is equivalent here to:
#   x2=x.dup; y.each { |e| x2.delete(e) }; x2
p z                 # => [4, 5]

x = []
x.empty?        # => true
x.nil?          # => false
# if you try to access a nonexistant element...
x[6].nil?       # => true

x = [1, 2, 3]
x.include?(3)   # => true
x.include?(4)   # => false

x.first         # => 1
x.last          # => 3

# I wish I'd known the following earlier!!
x.first(2)      # => [1, 2]
x.last(2)       # => [2, 3]

######### HASHES

h = {}
# note that key or value can be any type of object
x = { 1 => "a", 2 => "b" }
h = {'first_name' => 'Albert', 'last_name' => 'Einstein'}

# you can also use symbols
# BUT NOTE that 'last_name' and :last_name are different keys
h[:first_name] = 'Pedro'
h[:last_name] = 'Picasso'
p h           # => {"first_name"=>"Albert", "last_name"=>"Einstein", :first_name=>"Pedro", :last_name=>"Picasso"}

dictionary = { 'cat' => 'feline animal', 'dog' => 'canine animal' }
dictionary.delete('cat')      # => "feline animal"
dictionary                    # => {"dog"=>"canine animal"}

x = { 1 => "a", 2 => "b" }
x.each { |key, value| puts "#{key} equals #{value}" }
x.keys       # => [1, 2]
x.values     # => ["a", "b"]

x.delete_if { |key, value| key < 2 }
p x          # => {2=>"b"}

######### REGULAR EXPRESSIONS

/old/ =~ 'this old house' # 5 - the index of 'old'
/Russ|Russell/ =~ 'Fred' # nil – Fred is not Russ nor Russell
/.*/ =~ 'any old string' # 0 - the RE will match anything
/old/ !~ 'this old house' # false - the regular expression matchs
/Russ|Russell/ !~ 'Fred' # true – the regular expression doesn't match

# *     Match zero or more occurrences of the preceding character, 
#       and match as many as possible.
# +     Match one or more occurrences of the preceding character, 
#       and match as many as possible.

# *?    Match zero or more occurrences of the preceding character,
#       and match as few as possible.
# +?    Match one or more occurrences of the preceding character, 
#       and match as few as possible.

# ?     Match either one or none of the preceding character.
# {x}   Match x occurrences of the preceding character.
# {x,y} Match at least x occurrences and at most y occurrences.


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


if __FILE__ == $0
  # process only if this file is directly executed
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
