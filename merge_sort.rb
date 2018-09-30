def merge_sort(array)
  return array if array.length < 2
  first_half = merge_sort(array[0..(array.length/2 - 1)]) #=> [2] #=> [8]
  second_half = merge_sort(array[(array.length/2)..-1]) #=> [5,8] #=> [5]

  array = []
  until first_half.empty? || second_half.empty?
    if first_half[0] < second_half[0]
      array << first_half.shift
    else
      array << second_half.shift
    end
  end
  array.concat(first_half.empty? ? second_half : first_half)
end

a = Array.new(10).map {rand(0..100)}
p a
p merge_sort(a)
