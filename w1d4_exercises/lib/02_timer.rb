class Timer

  def initialize
    @seconds = 0
    @minutes = 0
    @hours = 0
  end

  attr_accessor :seconds

  def seconds=(secs)
    @seconds = secs
    self.minutes_and_hours
  end

  def minutes_and_hours
    @hours = (@seconds/3600).to_s
    @minutes = (@seconds%3600/60).to_s
    self.pad
    self.time_string
  end

  def pad
    @hours = "0#{@hours}" if @hours.length <2
    @minutes = "0#{@minutes}" if @minutes.length<2
    @pad = "0" if @seconds%3600%60<10
  end

  def time_string
    @time_string = "#{@hours}:#{@minutes}:#{@pad}#{@seconds%3600%60}"
  end
  
end
