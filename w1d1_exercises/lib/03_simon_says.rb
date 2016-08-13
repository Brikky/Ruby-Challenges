def echo(string)
 string
end

def shout(string)
  string.upcase
end

def repeat(string, repetitions = 2)
  new_string = ""
  repetitions.times {new_string << " " << string}
  new_string.strip
end

def start_of_word(string, length=1)
  string[0, length]
end

def first_word(string)
space = string.index(" ")
string[0, space]
end

def titleize(title)
  title_array = title.split(" ")
  not_words = ["and", "the", "over"]
  title_array.map{|word| word.capitalize! unless not_words.include? word}
  title_array[0].capitalize!
  title_array*" "
end
