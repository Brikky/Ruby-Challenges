class Book
  # TODO: your code goes here!
@@leave_lower = ["and", "in", "the", "a", "an", "of"]

  attr_reader :title

  def title=(booktitle)
    @title = booktitle.split
    @title.map {|word| word.capitalize! unless @@leave_lower.include?(word)}
    @title[0].capitalize!
    @title[-1].capitalize!
    @title = @title.join(" ")
  end


end
