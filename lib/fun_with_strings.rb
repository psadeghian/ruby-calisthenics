# Pash Sadeghian
# Dr. Verdicchio
# HW2
# 9/20/2015

module FunWithStrings
  def palindrome?
    str = self.downcase.gsub(/[^a-z]/i, "")
    str == str.reverse
    #self.downcase == self.reverse.downcase
  end
  def count_words
    hash = {}
    arr = self.split(" ")
    arr.each do |word|
      word = word.downcase.gsub(/[^a-z]/i, "") # remove everything but alphabets
      if word != ""
        hash[word] ||= 0
        hash[word] += 1
      end
    end
    return hash
  end
  def anagram_groups
    word_arr = self.split(" ") # create an array of words
    ana_groups = []
    ana_groups.push([""])
    # the empty string array is added to enable iteration
    # note: we cannot iterate over an empty array
    word_arr.each do |word|
      include = false # we assume the word is not included in the ana_groups array
      ana_groups.each do |arr|
        if word.downcase.chars.sort == arr[0].downcase.chars.sort
          # note: we compare the sorted lowercase characters
          arr.push(word)
          include = true
        end
      end
      unless include == true
        ana_groups.push([word])
      end
    end
    ana_groups.delete_at(0)
    # Here we delete the [""] which we created in the beginning
    return ana_groups
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end