
class TimeStack
  attr_reader :title
  
  def initialize(title)
    @title = title
    @blocks = []
  end
  
  def add_block(block)
    @blocks << block
  end
  
  def each_block
    @blocks.each { |block| yield block }
  end
  
end