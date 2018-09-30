def stock_picker(array)
  profits = array.map.with_index do |buy, index|
    sell = array[index..-1].max
    sell - buy
  end

  best_buy = profits.index(profits.max)
  best_sell = array[best_buy..-1].each_with_index.max[1] + best_buy
  [best_buy, best_sell]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
