def reverser
  yield.split.each{|word| word.reverse!}.join(" ")
end

def adder(number=1)
  yield+number
end

def repeater(number=1)
  number.times{yield}
end

puts adder(10) {10}
repeater(2) {puts "Hi"}
