class String
  def substrings(dictionary)
    dictionary.inject({}) do |result, substring|
      repeats = self.scan(Regexp.new(substring, "i")).size
      if repeats == 0
        result
      else
        result[substring] = repeats
        result
      end
    end
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
string = "Howdy partner, sit down! How's it going?"
p string.substrings(dictionary)
