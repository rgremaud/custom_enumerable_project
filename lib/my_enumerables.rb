module Enumerable
  def my_all? # doesn't work - same as any?
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
  
  def my_count # doesn't work
    count = 0
    new_array = []
    for item in self
      if yield(item)
        new_array << item
      end
    end
    count = new_array.length
  end

end

class Array
  def my_each
    for item in self
      yield(item)
    end
  end
end
