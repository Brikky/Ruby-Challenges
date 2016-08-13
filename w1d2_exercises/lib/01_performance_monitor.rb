require "time"

#returns the average time to complete a block after running
#the block a given number of times
def measure (number=1)
  start = Time.now
  number.times{yield}
  (Time.now - start)/number
end
