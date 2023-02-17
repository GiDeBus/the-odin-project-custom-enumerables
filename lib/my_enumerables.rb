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
