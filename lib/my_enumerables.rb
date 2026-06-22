module Enumerable
  # Your code goes here
  def my_each_with_index
    count = 0
    if block_given?
      self.my_each do |i|
        idx = count
        yield(i, idx)
        count += 1
      end
    else
      arr = []
      self.my_each do |i|
        idx = count
        arr << [i, idx]
        count += 1
      end
      arr.to_enum
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      for elem in self do
      yield(elem)
      end
    else 
      self.to_enum
    end
  end
end

# array = [2, 3, 4, 5]
# a = array.my_each_with_index do |element, index|
#           my_each_with_index_results << [element * 2, index * 2]
#         end
# p a