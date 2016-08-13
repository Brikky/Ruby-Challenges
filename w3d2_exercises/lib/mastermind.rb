class Code
  attr_reader :pegs

  PEGS = {
    "R" => :red,
    "O" => :orange,
    "Y" => :yellow,
    "G" => :green,
    "B" => :blue,
    "P" => :purplse
  }

  COLORS = ["R", "O", "Y", "G", "B", "P"]

  def self.parse(letters)
    pegs = letters.split("").map do |letter|
      raise unless PEGS[letter.upcase]
      PEGS[letter.upcase]
     end
    Code.new(pegs)
  end

  def [](i)
    @pegs[i]
  end

  def ==(guess)
    return false if guess.class != Code
    self.pegs == guess.pegs
  end

  def initialize(pegs)
    @pegs = pegs
  end

  def self.random
    colors = COLORS.shuffle[0..3]
    pegs = {
      colors[0] => PEGS[colors[0]],
      colors[1] => PEGS[colors[1]],
      colors[2] => PEGS[colors[2]],
      colors[3] => PEGS[colors[3]]
    }

    Code.new(pegs)
  end

  def exact_matches(guess)
    matches = 0
    i = 0
    while i < pegs.length
      matches += 1 if guess[i] == pegs[i]
      i+=1
    end
    matches
  end

  def near_matches(guess)
  matches = 0
  check_pegs = pegs.clone 
  i = 0

  while i < pegs.length
    if check_pegs.include? guess[i]
      matches += 1
      #delete at the location of the index of the guess
      check_pegs.delete_at(check_pegs.index(guess[i]))
    end
    i+=1
  end
  matches - exact_matches(guess)
  end

end

class Game
  attr_reader :secret_code

  def initialize(secret_code = Code.random)
    @secret_code = secret_code
  end

  def get_guess
    ARGV.clear
    guess = gets.chomp
    Code.parse(guess)
  end

  def display_matches(guess)
    puts "exact matches found: #{@secret_code.exact_matches(guess)}."
    puts "near matches found: #{@secret_code.near_matches(guess)}"
  end

end
