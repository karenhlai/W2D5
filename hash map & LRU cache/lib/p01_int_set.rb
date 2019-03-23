require 'byebug'
class MaxIntSet
  def initialize(max)
    @range = Array.new(max) { false }
    @max = max
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @range[num] = true
  end

  def remove(num)
    @range[num] = false
  end

  def include?(num)
    @range[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % 20] << num
  end

  def remove(num)
    @store[num % 20].delete(num)
  end

  def include?(num)
    @store.flatten.include?(num)
  end

  private

  def [](num)
    n % @store.length = bucket_pos
    bucket_pos
  end


  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @store[num % num_buckets].empty? 
      @store[num % num_buckets] << num
      @count += 1
      if @count == num_buckets
        resize!
      end
    end
  end

  def remove(num)
    if @store.flatten.include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end
  
  private
  def [](num)
    n % @store.length = bucket_pos
    bucket_pos
  end

  def num_buckets
    @store.length
  end

  def resize!
    # debugger
    old_stores = @store.dup.flatten
    new_buckets = num_buckets * 2
    @count = 0
    @store = Array.new(new_buckets) { Array.new }
    old_stores.each { |el| self.insert(el) }
  end
end


# dup our old store to retain all references to old elements
# create a new store with num_buckets * 2
# insert logic is ONLY calling resize when we KNOW that we want it to run
