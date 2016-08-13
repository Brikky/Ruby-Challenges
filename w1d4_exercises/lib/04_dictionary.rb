class Dictionary
  # TODO: your code goes here!

  def initialize
    @entries = {}
  end

  def entries
    @entries
  end

  def words
    words = []
    @entries.each_key {|key| words << key }
    words
  end

  def keywords
    self.words.sort!
  end

  def definitions
    definitions = []
    @entries.each_key {|key| definitions << @entries[key]}
    definitions
  end

  def add(new_words)
    if new_words.class == String
      @entries.merge!(Hash.try_convert(new_words => nil))
    elsif new_words.class == Hash
      @entries.merge!(new_words)
    else
  "Wrong input type."
    end
  end

  def include?(word)
  @entries.include? word
  end

  def find(word)
    search_words = self.words
    found = {}

    i=0
    while i < search_words.length
      if search_words[i].start_with? word
        found[search_words[i]] = @entries[search_words[i]]
      end
      i+=1
    end
    found
  end


  def printable
  words = self.keywords
  print_type = ""

    i=0
    while i < words.length
      print_type += "[#{words[i]}] \"#{@entries[words[i]]}\"\n"
      i+=1
    end
    print_type.strip
  end


end
