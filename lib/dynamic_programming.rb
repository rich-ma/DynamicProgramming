class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frog_cache = { 
      1 => [[1]], 
      2=> [[1,1], [2]], 
      3 => [[1,1,1], [2,1], [1,2], [3]]
    }
    @super_cache = { 0 => [] }
  end

  def blair_nums(n)
    return @blair_cache[n] unless @blair_cache[n].nil?
    num = blair_nums(n-1) + blair_nums(n-2) + 2*(n-1) - 1
    @blair_cache[n] = num
    num
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(k)
    cache = { 
      1 => [[1]], 
      2=> [[1,1], [2]], 
      3 => [[1,1,1], [2,1], [1,2], [3]]
    }
    return cache if k <= 3
    (4..k).each do |n|
      result = []
      1.upto(3) do |j|
        cache[n - j].each { |res| result << (res + [j]) }
      end
      cache[n] = result
    end
    cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
    @frog_cache[n]
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] unless @frog_cache[n].nil?
    result = []
    1.upto(3) do |j|
      frog_hops_top_down(n-j).each { |res| result << (res + [j]) }
    end
    @frog_cache[n] = result
    result
  end

  def super_frog_hops(n, k)
    @super_cache = { 0 => [] }
    super_frog_helper(n, k)
    @super_cache[n]
  end

  def super_frog_helper(n, k)
    return @super_cache[n] unless @super_cache[n].nil?
    result = []
    result << [n] if k >= n
    1.upto(k) do |j|
      break if n - j < 0
      super_frog_helper(n-j, k).each { |res| result << (res + [j]) }
    end
    @super_cache[n] = result
    result
  end

  def knapsack(weights, values, capacity)
    table = []
    0.upto(capacity) do |cap|
      result = []
      0.upto(weight.length) do |i|
        
        
        
      end
    end
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
