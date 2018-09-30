class Array
  def bubble_sort
    array = self
    last_index = array.length - 2
    is_sorted = false
    until is_sorted
      is_swapped = false
      0.upto(last_index) do |i|
        comparison = block_given? ? yield(array[i], array[i+1]) : array[i] <=> array[i+1]
        if comparison > 0
          array[i], array[i+1] = array[i+1], array[i]
          is_swapped = true
        end
      end
      last_index -= 1
      is_sorted = true unless is_swapped
    end
    return array
  end

  def simple_bubble_sort
    array = self
    (array.length - 1).times do
      0.upto(array.length - 2) do |i|
        if array[i] > array[i+1]
          array[i], array[i+1] = array[i+1], array[i]
        end
      end
    end
    array
  end
end
