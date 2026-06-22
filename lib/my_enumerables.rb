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

  def my_select
    if block_given?
      result = []
      self.my_each do |elem|
        result << elem if yield(elem)
      end
      return result
    else
      self.to_enum
    end
  end

  def my_all?
    if block_given?
      self.my_each{|elem| return false if !yield(elem)} 
      return true
    else
      return true
    end
  end

  def my_any? 
    if block_given?
      self.my_each{|elem| return true if yield(elem)}
      return false
    else
      return true
    end
  end

  def my_none?
    if block_given?
      self.my_any?{|elem| return false if yield(elem)}
      return true
    else 
      return false
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

array = [2,3,4,5]
p array.my_none? { |value| value == 1 }