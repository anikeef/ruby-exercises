def append(arr, n)
  return [0] if n == 0
  return (arr << n) + append([], n - 1)
end

# p append([], 10)

def reverse_append(arr, n)
  return arr if n < 0
  arr.unshift(n)
  reverse_append(arr, n - 1)
end

# p reverse_append([], 3) # => [0,1,2,3]

def factorial(n)
  return n if n == 1
  return n * factorial(n-1)
end

# p factorial(0)

def palindrome(string)
  return true if string.length == 1 || string.length == 0
  if string[0] == string[-1]
    palindrome(string[1..-2])
  else
    false
  end
end

# p palindrome("abccfba")

def bottles(n)
  if n == 0
    puts "No bottles on the wall"
  else
    puts "#{n} bottles on the wall"
    bottles(n - 1)
  end
end

# bottles(4)

def fib(n)
  return n if n == 0 || n == 1
  return fib(n - 1) + fib(n - 2)
end

# p fib(7)

def flatten(arr, result = [])
  arr.each do |element|
    if element.kind_of?(Array)
      flatten(element, result)
    else
      result << element
    end
  end
  result
end

# p flatten([[1, [8, 9]], [3, 4]] )

roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

def roman(num, result = "")
  if num <= 10000
    result += roman_mapping[num/1000]
    num -= num/1000 * 1000
  end
end
