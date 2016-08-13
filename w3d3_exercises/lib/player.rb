class HumanPlayer
attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_play
    prompt 
    gets.chomp.split(",").each {|n| n.to_i}
  end

  def prompt
    puts "Please enter move as 'X,Y'"
  end
end
