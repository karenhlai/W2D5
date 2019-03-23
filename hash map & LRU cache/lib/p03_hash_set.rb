class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @store[key] << key
  end

  def include?(key)
    if @store.include?(key)
      return true
    else 
      false
    end
  end

  def remove(key)
  end

  private

  def [](num)
    num.hash % @store.length = bucket_pos
    bucket_pos
  end

  a = [1, 2, 3]
  a[0] = value
  a.[](0, value)

  def num_buckets
    @store.length
  end

  def resize!
  end
end
