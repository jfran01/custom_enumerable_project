module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      for i in self do
      yield(i)
      end
    else 
      self.to_enum
    end
  end
end

array = [1,2,3,4]
each_results = array.my_each
p each_results