def initial(word)
  word.downcase!
  stop = word.index(/[aeiouy]/)
  stop+=1 if (word[stop-1] == "q")
  word[0,stop]
end

def initial_to_end(word)
 word_initial = initial(word)
 word[word_initial.length..word.length]<<word_initial
end

def latify(word)
  initial_to_end(word)<<"ay"
end

def translate(string)
  string.split(" ").map{|word| latify(word)}.join(" ")
end
