module Enumerable
  def my_each
    self.length.times do |i|
      yield(self[i])
    end
    self
  end

  def my_each_with_index
    self.length.times do |i|
      yield(self[i], i)
    end
  end

  def my_select
    arr = []
    self.my_each {|item| arr << item if yield(item)}
    arr
  end

  def my_all?
    self.my_each {|item| return false unless yield(item)}
    return true
  end

  def my_any?
    self.my_each {|item| return true if yield(item)}
    return false
  end

  def my_none?
    self.my_each {|item| return false if yield(item)}
    return true
  end

  def my_count?(*args)
    count = 0
    if block_given?
      self.my_each { |item| count += 1 if yield(item) }
    elsif args.length != 0
      self.my_each { |item| count += 1 if args === item }
    else
      self.my_each { |item| count += 1 }
    end
    return count
  end

  def my_map
    arr = []
    self.my_each {|item| arr << yield(item)}
    return arr
  end

  def my_inject(*initial)
    if initial.length == 0
      sum, array = self[0], self[1..-1]
    else
      sum, array = initial[0], self
    end

    array.my_each do |item|
      sum = yield(sum,item)
    end
    return sum
  end

  def multiply_els
    self.my_inject { |a,b| a * b }
  end
end
