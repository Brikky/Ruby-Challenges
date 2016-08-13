class Fixnum
  @@singles_by_one = {
    0 => 'zero',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine'
  }

  @@tens_by_ten = {
    20 => 'twenty',
    30 => 'thirty',
    40 => 'forty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety'
  }

  @@teens_by_one = {
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen'
  }

  @@orders = {
    100 => 'hundred',
    1000 => 'thousand',
    1_000_000 => 'million',
    1_000_000_000 => 'billion',
    1_000_000_000_000 => 'trillion'
  }

  def in_words(number = self)
    return @@singles_by_one[number] if number < 10
    return @@teens_by_one[number] if number < 20
    return twenty_to_hundred(number) if number < 100
    higher_order_words(number)
  end

  def higher_order_words(number = self)
    order = number.find_order
    order_scale = "#{(number / order).in_words} #{@@orders[order]}"
    if (number % order) > 0
      "#{order_scale} #{(number % order).in_words}"
    else
      order_scale
    end
  end

  def find_order(number = self)
    @@orders.keys.take_while { |order| order <= number }[-1]
  end

  def twenty_to_hundred(number = self)
    tens_word = @@tens_by_ten[(number / 10) * 10]
    if (number % 10) > 0
      "#{tens_word} #{(number % 10).in_words}"
    else
      tens_word
    end
  end
end
