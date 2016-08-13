# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  computers_number = 1 + rand(100)
  this_guess = 0
  guesses = 0

  while (this_guess != computers_number)
    puts "Guess a number!"
    guesses += 1
    this_guess = gets.chomp.to_i

    if this_guess > computers_number
      puts "#{this_guess} is too high! That was guess number #{guesses}"
    elsif this_guess < computers_number
      puts "#{this_guess} is too low! That was guess number #{guesses}"
    elsif this_guess == computers_number
      puts "#{this_guess}, You got it! And it only took #{guesses} guesses!"
    end
  end
end
