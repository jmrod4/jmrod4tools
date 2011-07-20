
class StackList
  
  def initialize
    @stacks = []
  end
  
  def add_stack(stack)
    @stacks << stack
  end
  
  def each_stack
    @stacks.each { |stack| yield stack }
  end
end