ruby_patterns
=============

some examples and notes about design of ruby programs making emphasis in design patterns

Warning: this is mainly a cheat sheet for myself, others may want to take a look to the materials referenced at the bottom.


General Principles
------------------

* Prefer composition over inheritance (Olsen 2007 p.7)


Behavioral patterns
-------------------

Most of these design patterns are specifically concerned with communication between objects


### Template Method 

**defines the skeleton of an algorithm as an abstract class, allowing its subclasses to provide concrete behavior** (pushes down the variable parts of the algorithm into a subclass)

Ruby example: *baseclass* contains the invariant logic plus (optionaly) some methods that could (empty *hook methods* to hint use) or must (abstract methods) be overriden in the subclasses implementing the variations.

Olsen (Olsen 2007) recomends an evolutionary approach:
 
> Start with one variation and simply code as though it was the only problem   that you need to solve.
>
> [...]
>
> Next, you could refactor the method that will become the template method so   that it calls other methods for the variable parts of the algorithm, but still  just focus on the one case.
>
> [...]
>
> Finally, you could create a subclass for your first case and move your  specific implementation into that subclass. At this point, you are ready to  start coding the rest of the variations.

Pitfalls: overdue things trying to cover all possibilities

Cons: relay heavily in inheritance: more (potential) coupling, less flexibility


### Strategy

**allows one of a family of algorithms to be selected on-the-fly at runtime** (implements the variable parts of the algorithm as a separate object: class or proc)

#### Strategy with inheritance / classes

Ruby example: a external baseclass define which are the abstract methods that will contain the variant part of algorithm (**strategy**) and then subclass it to implement concrete variants (strategies) of the algorithm and are passed as an initialize argument (thus in run time) to the class (**context**) that implements the invariant logic.

As a note, you don't need the base class at all if you just make sure the strategies ones have the correct methods. 

And you can pass alternatively as argument a instance of the strategy or just its class name)

When complex data has to be shared then it can be passed from the context to the strategy using *self* as argument in the strategy method call (even if it increases the coupling between them)

Pitfalls: getting wrong the interface between the context and the strategy, it should be as uncoupled as possible.


#### Strategy with procs

You can substitute the strategies clasess with proc objects (blocks of code).

	class SomeObject
	  def initialize (&strategy)
		@strategy = strategy
	  end
	  
	  def use_strategy
		@strategy.call(self)
	  end
	end

	STRATEGY_1 = lambda do |context|
	  # the strategy code using context.data / context.method
	end
	
	some_object = SomeObject.new &STRATEGY_1
	some_object.use_strategy

Cons: proc approach "works only when the strategy interface is a single method affair".

An example of strategy with procs is the implementation of sort:

	# the proc takes two arguments and must return (like the <=> operator):
	#	1 if 1st element is larger
	#	0 if equal
	#	-1 if 2nd element is larger
	a.sort { |a,b| a.length <=> b.length }
	

### Observer

**is a publish/subscribe pattern which allows a number of observer objects to see an event**

#### Observer using the Ruby Observable mixin

	require 'observer'
	
	class MySubjectClass
	  include Observable
	
	  def my_method_to_observe(somearg)
		#... some code
		changed                # needed to set that something really changed
		notify_observers(self) # (also set changed flag to false)
	  end
	  
	end

#### Observer with code blocks

	module Subject
	  def initialize
	    @observers=[]
	  end
	  
	  def add_observer(&observer)
	    @observers << observer
      end
	  
	  def delete_observer(observer)
	    @observers.delete(observer)
	  end
	  
	  def notify_observers
	    @observers.each do |observer|
	      observer.call(self)
	    end
      end
    end
	
	class MySubjectClass
	  include Subject
	  
	  def my_method_to_observe(somearg)
	    #... some code that need to be notified
		notify_observers
	  end
	end
	
	obj = MySubjectClass.new(someargs)
	obj.add_observer do |my_subject|
	  #... some code done as response to notification
	end
	
### Command

creates objects which encapsulate actions and parameters


### Interpreter

implements a specialized language


### Iterator

accesses the elements of an object sequentially without exposing its underlying representation


Structural Patterns
-------------------

These concern class and object composition. They use inheritance to compose interfaces and define ways to compose objects to obtain new functionality

### Adapter

allows classes with incompatible interfaces to work together by wrapping its own interface around that of an already existing class

### Composite

composes zero-or-more similar objects so that they can be manipulated as one object

### Decorator

dynamically adds/overrides behaviour in an existing method of an object

### Facade

provides a simplified interface to a large body of code

### Proxy

provides a placeholder for another object to control access, reduce cost, and reduce complexity

Creational Patterns
-------------------

Creational patterns are ones that create objects for you, rather than having you instantiate objects directly. This gives your program more flexibility in deciding which objects need to be created for a given case

### Abstract Factory

groups object factories that have a common theme
    
### Factory Method

creates objects without specifying the exact class to create.

### Builder

constructs complex objects by separating construction and representation.

### Singleton

restricts object creation for a class to only one instance.



Sources / Bibliography 
----------------------

* GoF (The "Gang of Four") 1994. "Design Patterns: Elements of Reusable Object-Oriented Software" USA: Addison-Wesley 
* Olsen, Russ 2007. "Design Patterns in Ruby" Boston: Pearson Education
* Olsen, Russ Companion site <http://designpatternsinruby.com> for the "Design Patterns in Ruby" book
* [Wikipedia article on the "Design Patterns" book](http://en.wikipedia.org/wiki/Design_Patterns)

