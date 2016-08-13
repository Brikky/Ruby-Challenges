class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players)
    @referee = players[:referee]
    @guesser = players[:guesser]
  end

  def setup
    length = @referee.pick_secret_word
    @guesser.register_secret_length(length)
    @board = Array.new(length)
  end

  def take_turn
    guess = @guesser.guess
    indexes = @referee.check_guess(guess)
    update_board(guess,indexes)
    @guesser.handle_response
  end

  def update_board(guess, indexes)
    indexes.each{|i| @board[i] = guess}
  end


end

class HumanPlayer

  attr_reader :name

  def initialize(name = "Human Player")
    @name = name
  end


end

class ComputerPlayer
  @secret_word
  @secret_letters
  @dictionary
  ABC = ('a'..'z').to_a
  @candidate_words
  # @@dictionary = File.readlines("lib/dictionary.txt")


  attr_reader :name

  def initialize(dictionary = File.readlines("lib/dictionary.txt"))
    @dictionary = dictionary
    @secret_letters = []
  end

  def pick_secret_word
    @secret_word = @dictionary.shuffle[0]
    @secret_letters = @secret_word.split("")
    @secret_word.length
  end

  def check_guess(letter)
    @secret_letters.find_index(letter)
    @secret_letters.each_index.select{|i| @secret_letters[i] == letter}
  end

  def guess(board=@secret_letters)
    @secret_letters = board
      letters = candidate_words.join.split("")
      letter = most_common_letter(letters)
  end

  def most_common_letter(letters_array)
    uniq_letters = letters_array.uniq
    @secret_letters.each {|l| letters_array.delete(l)}
    number_of_letters = uniq_letters.length

    i=0
    most_common = uniq_letters[0]
    while i < number_of_letters
      most_instances = all_indexes(letters_array, most_common).length
      compare_instances = all_indexes(letters_array, uniq_letters[i]).length
      if compare_instances > most_instances
        most_common = uniq_letters[i]
      end
      i+=1
    end
    most_common
  end


  def register_secret_length(length)
    @secret_letters = Array.new(length)
  end

  def handle_response(guess, indexes)
    @guess = guess
    indexes.each {|i| @secret_letters[i] = guess}
    if indexes.length == 0
      @dictionary = @dictionary.each.select {|w| !w.index(@guess)}
    end
  end

  def all_indexes(enum, value)
    indexes = []
    enum = enum.split("") if enum.class == String
    enum.each_with_index{ |v, i| indexes << i if v == value }
    indexes
  end


  def candidate_words
    words = @dictionary.select{|word| word.length == @secret_letters.length}
    i = 0
    while i < @secret_letters.length
      letter = @secret_letters[i]
      if !letter.nil?
        words = words.select do |word|
          all_indexes(@secret_letters, letter) == all_indexes(word, letter)
        end
      end
      i+=1
    end
    words

  end

end
