def fibs_rec(num, depth = 2, result = [1])
  result.length == num ? result : fibs_rec(num, result << sum_of_last(result, depth))
end

def sum_of_last(arr, depth)
	(depth - arr.length).times { arr = [0].concat(arr) } if (depth - arr.length) > 0
	arr[-depth..-1].inject(&:+)
end

p fibs_rec(2)
# a = [1,1,2,3,5]
# p a
# p sum_of_last(a, 2)
# p a
# p a << sum_of_last(a,2)
# result = []
# 2.upto(100) do |n|
# 	a = fibs_rec(1000, n)
# 	result << a[-1]/a[-2]
# end

# puts result