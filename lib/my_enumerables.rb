module Enumerable
  def my_all?
    self.my_each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_none? 
    self.my_each do |elem|
      return false if yield(elem)
    end
    true
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_map
    new_array = []
    for item in self
      new_array << yield(item)
    end
    new_array
  end

  def my_select
    new_array = []
    for item in self
      if yield(item) == true
        new_array << item
      end
    end
    new_array
  end
  
  def my_count
    count = 0
    if block_given?
      self.my_each do |elem|
        count += 1 if yield(elem) == true 
        end
    else 
      count = self.length
    end
    count
  end

  def my_each_with_index
    index = 0
    for item in self do
        yield(item, index)
        index += 1
    end
  end

  def my_inject(initial_value) # doesn't work
    # [1,2,3,4].inject(10) { |result, element| result + element } = 20 (10 + 1 + 2 + 3 + 4)
    result = initial_value
    self.my_each do |result, element|
      result = yield(result, element)
    end
  end

end

class Array
  def my_each
    for item in self
      yield(item)
    end
  end
end
