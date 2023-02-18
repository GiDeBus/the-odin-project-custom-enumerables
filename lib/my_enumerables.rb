module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    self.size.times { |index| yield self[index], index }
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    selected = []
    my_each { |element| selected.push(element) if yield element }
    selected
  end

  def my_all?(condition = nil)
    if block_given?
      my_each { |element| return false unless yield element }
    else
      my_each { |element| return false unless element === condition }
    end
    true
  end

  def my_any?(condition = nil)
    if block_given?
      my_each { |element| return true if yield element }
    else
      my_each { |element| return true if element === condition }
    end
    false
  end

  def my_count(arg = nil)
    return self.length if arg.nil? && !block_given?
    count = 0
    if block_given?
      my_each { |element| count += 1 if yield element }
    elsif !arg.nil?
      my_each { |element| count += 1 if element === arg }
    end
    count
  end

  def my_none?(condition = nil)

    if block_given?
      my_each { |element| return true unless yield element }
    elsif !condition.nil?
      my_each { |element| return true unless element === condition }
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
    return to_enum(:my_each) unless block_given?
    for element in self do
      yield element
    end
    self
  end
end
