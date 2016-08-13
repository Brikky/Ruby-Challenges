def add(one, two)
  one + two
end

def subtract(one, two)
  one - two
end

def sum(array)
  sum = 0
  array.each{|x| sum+= x}
  sum
end

def multiply(*numbers)
  array = nums_to_array
  product = 1
  array.each{|x| product*=x}
  product
end

def nums_to_array(*numbers)
numbers.join(',').split(',').map{|s| s.to_i}
end

def multiply(array)
  product = 1
  array.each{|x| product*=x}
  product
end

def power (one, two)
  one**two
end

def factorial(number)
  factor = 0
  0.upto(number) {|digit| factor+=digit}
  factor
end
