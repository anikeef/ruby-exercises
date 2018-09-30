def fibs num
  arr = [1]
  1.upto(num-1) { |n| arr[n] = arr[n-1] + arr[(n-2).abs].to_i }
  arr
end

def fibs_rec(num, result = [1])
  result.length == num ? result : fibs_rec(num, result << result[-1] + result[-2].to_i)
end
