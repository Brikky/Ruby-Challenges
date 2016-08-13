class Temperature
  # TODO: your code goes here!

  def initialize(hash={})
  @fahrenheit = hash[:f]
  @celsius = hash[:c]
  end

  def in_fahrenheit
    @fahrenheit = @celsius*9/5.0+32.00 if @fahrenheit == nil
    @fahrenheit
  end

  def in_celsius
    @celsius = (@fahrenheit-32)*5/9.0 if @celsius == nil
    @celsius
  end

  def self.from_celsius(degrees)
    Temperature.new(:c => degrees )
  end

  def self.from_fahrenheit(degrees)
    Temperature.new(:f => degrees)
  end
end

class Celsius < Temperature
 def initialize(degrees = 0)
   @celsius = degrees
end

end

class Fahrenheit < Temperature
 def initialize (degrees = 0)
    @fahrenheit = degrees
end

end
