require './application'

class TimeBlock

  attr_reader :title, :minutes
  
  def initialize(title, minutes)
    @title = title
    @minutes = minutes
    @seconds_left = minutes * 60
  end
  
  def run
    puts
    puts "TIME: #{@minutes} #{"minute".plural(minutes)}, TITLE: #{@title}"
    time_end = Time.new + @seconds_left
    while @seconds_left > 0
      softline_puts ' '*6 + seconds_to_s(@seconds_left)
      sleep 1
      @seconds_left = time_end - Time.new
    end
    softline_delete
    5.times { print 7.chr; sleep 0.5 }
    puts ' '*6 + "Done."
  end
    
  private
  
  def seconds_to_s(seconds)
    sprintf "%i:%02i", seconds/60, seconds%60
  end
  
end