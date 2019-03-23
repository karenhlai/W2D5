class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_num = 0
    self.each_with_index do |el, i|
      hash_num += (el.hash ^ i.hash)
    end
    hash_num
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a 
    hash_arr = []
    
    self.each_char do |el|
      idx_val = alphabet.index(el)
      hash_arr << idx_val
    end
    hash_arr.hash #calling from line 6, not 16 dummy!
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.flatten.map(&:to_s).sort.hash
  end
end
