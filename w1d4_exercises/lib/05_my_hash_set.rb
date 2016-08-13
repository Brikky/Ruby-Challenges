# MyHashSet
#
# Ruby provides a class named `Set`. A set is an unordered collection of
# values with no duplicates.  You can read all about it in the documentation:
#
# http://www.ruby-doc.org/stdlib-2.1.2/libdoc/set/rdoc/Set.html
#
# Let's write a class named `MyHashSet` that will implement some of the
# functionality of a set. Our `MyHashSet` class will utilize a Ruby hash to keep
# track of which elements are in the set.  Feel free to use any of the Ruby
# `Hash` methods within your `MyHashSet` methods.
#
# Write a `MyHashSet#initialize` method which sets an empty hash object to
# `@store`. Next, write an `#insert(el)` method that stores `el` as a key
# in `@store`, storing `true` as the value. Write an `#include?(el)`
# method that sees if `el` has previously been `insert`ed by checking the
# `@store`; return `true` or `false`.
#
# Next, write a `#delete(el)` method to remove an item from the set.
# Return `true` if the item had been in the set, else return `false`.  Add
# a method `#to_a` which returns an array of the items in the set.
#
# Next, write a method `set1#union(set2)` which returns a new set which
# includes all the elements in `set1` or `set2` (or both). Write a
# `set1#intersect(set2)` method that returns a new set which includes only
# those elements that are in both `set1` and `set2`.
#
# Write a `set1#minus(set2)` method which returns a new set which includes
# all the items of `set1` that aren't in `set2`.

class MyHashSet
def initialize
  @store = {}
end

def insert(element)
  @store[element] = true
end

def include?(element)
  @store.include? element
end

def delete(element)
  if self.include?(element)
    @store.delete(element)
    true
  else
    false
  end
end

def to_a
  keys = []
  @store.each_key{|key| keys << key}
  keys
end

def union(set)
  new_set = MyHashSet.new
  set1 = self.to_a
  set2 = set.to_a
  i = 0
  while i < set1.length
    new_set.insert(set1[i]) unless new_set.include?(set1[i])
    i+=1
  end
  i=0
  while i < set2.length
    new_set.insert(set2[i]) unless new_set.include?(set2[i])
    i+=1
  end
  new_set
end

def intersect(set)
  new_set = MyHashSet.new
  set2 = set.to_a
  set1 = self.to_a
  max = set1.length > set2.length ? set1 : set2

  i = 0
  while i < max.length
    if self.include?(max[i]) && set.include?(max[i])
      new_set.insert(max[i])
    end
    i+=1
  end
  new_set
end

def minus(set)
  new_set = MyHashSet.new
  set2 = set.to_a
  set1 = self.to_a
  max = set1.length > set2.length ? set1 : set2

  i = 0
  while i < max.length
    new_set.insert(set1[i]) unless set.include?(set1[i])
    i+=1
  end
  new_set
end

end
# Bonus
#
# - Write a `set1#symmetric_difference(set2)` method; it should return the
#   elements contained in either `set1` or `set2`, but not both!
# - Write a `set1#==(object)` method. It should return true if `object` is
#   a `MyHashSet`, has the same size as `set1`, and every member of
#   `object` is a member of `set1`.
