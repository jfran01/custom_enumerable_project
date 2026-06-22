module Enumerable
  # Your code goes here
  def my_each_with_index
    count = 0
    if block_given?
      my_each do |i|
        idx = count
        yield(i, idx)
        count += 1
      end
    else
      arr = []
      my_each do |i|
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
      my_each do |elem|
        result << elem if yield(elem)
      end
      result
    else
      to_enum
    end
  end

  def my_all?
    return true unless block_given?

    my_each { |elem| return false unless yield(elem) }
    true
  end

  def my_any?
    return true unless block_given?

    my_each { |elem| return true if yield(elem) }
    false
  end

  def my_none?
    return false unless block_given?

    my_any? { |elem| return false if yield(elem) }
    true
  end

  def my_count(&block)
    return size unless block_given?

    result = my_select(&block)
    result.size
  end

  def my_map
    if block_given?
      result = []
      my_each do |elem|
        result << yield(elem)
      end
      result
    else
      to_enum
    end
  end

  def my_inject(init)
    accum = init
    my_each do |elem|
      accum = yield(accum, elem)
    end
    accum
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
      to_enum
    end
  end
end
