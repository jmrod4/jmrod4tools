ruby_patterns
=============

some examples and notes about design of ruby programs

General Principles
------------------

* Prefer composition over inheritance (Olsen 2007 p.7)

Behavioral patterns
-------------------

Most of these design patterns are specifically concerned with communication between objects

### Template Method 

defines the skeleton of an algorithm as an abstract class, allowing its subclasses to provide concrete behavior

the abstract *base class* contains *hook methods* (i.e. empty) that could/must be overriden in the subclasses

Olsen (Olsen 2007) recomends an evolutionary approach: 
* "Start with one variation and simply code as though it was the only problem
  that you need to solve."
* "Next, you could refactor the method that will become the template method so
  that it calls other methods for the variable parts of the algorithm, but still
  just focus on the one case."
* "Finally, you could create a subclass for your first case and move your
  specific implementation into that subclass. At this point, you are ready to
  start coding the rest of the variations."

### Command

creates objects which encapsulate actions and parameters

### Interpreter

implements a specialized language

### Iterator

accesses the elements of an object sequentially without exposing its underlying representation

### Observer

is a publish/subscribe pattern which allows a number of observer objects to see an event

### Strategy

allows one of a family of algorithms to be selected on-the-fly at runtime

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
* Olsen, Russ [Companion site](http://designpatternsinruby.com/) for the "Design Patterns in Ruby" book
* [Wikipedia article on the "Design Patterns" book](http://en.wikipedia.org/wiki/Design_Patterns)

