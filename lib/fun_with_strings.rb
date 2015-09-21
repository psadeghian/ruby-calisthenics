module FunWithStrings
  def palindrome?
    str = self.downcase.gsub(/[^a-z]/i, "")
    str == str.reverse
    #self.downcase == self.reverse.downcase
  end
  def count_words
    hash = {}
    #return hash if self == ""
    arr = self.split(" ")
    arr.each do |word|
      word = word.downcase.gsub(/[^a-z]/i, "")
      if word != ""
        hash[word] ||= 0
        hash[word] += 1
      end
    end
    return hash
  end
  def anagram_groups
    word_arr = self.split(" ")
    ana_groups = []
    ana_groups.push([""])
    # I the empty string array to enable iteration
    word_arr.each do |word|
      include = false
      ana_groups.each do |arr|
        if word.downcase.chars.sort == arr[0].downcase.chars.sort
          arr.push(word)
          include = true
        end
      end
      unless include == true
        ana_groups.push([word])
      end
    end
    ana_groups.delete_at(0)
    # Here I delete [""]
    return ana_groups
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end