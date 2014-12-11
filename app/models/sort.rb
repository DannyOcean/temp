class Sort
  attr_reader :response, :i

  def initialize
    @response = {}
    @i = 0
  end


  def long_mergesort(array)
    # binding.pry
    snapshot! [], [], array

    if array.count <= 1
      # Array of length 1 or less is always sorted
      return array
    end

    # Apply "Divide & Conquer" strategy

    # 1. Divide
    mid = array.count / 2
    part_a = long_mergesort array.slice(0, mid)
    part_b = long_mergesort array.slice(mid, array.count - mid)
    snapshot! part_a, part_b, array

    # 2. Conquer
    array = []
    offset_a = 0
    offset_b = 0
    snapshot! part_a, part_b, array, offset_a, offset_b
    
    while offset_a < part_a.count && offset_b < part_b.count
      a = part_a[offset_a]
      b = part_b[offset_b]

      # Take the smallest of the two, and push it on our array
      if a <= b
        array << a
        offset_a += 1
        
        snapshot! part_a, part_b, array, offset_a, offset_b
      else
        array << b
        offset_b += 1

        snapshot! part_a, part_b, array, offset_a, offset_b
      end
    end

    # There is at least one element left in either part_a or part_b (not both)
    while offset_a < part_a.count
      array << part_a[offset_a]
      offset_a += 1

      snapshot! part_a, part_b, array, offset_a, offset_b
    end

    while offset_b < part_b.count
      array << part_b[offset_b]
      offset_b += 1
      
      snapshot! part_a, part_b, array, offset_a, offset_b
    end

    return array
  end

  def mergesort(array)
    return array if array.size <= 1
    left  = mergesort array[0, array.size / 2]
    right = mergesort array[array.size / 2, array.size]

    merge(left, right)
  end

  private
  
    def merge(left, right)
      result = []
     
      while left.size > 0 && right.size > 0
        result << if left[0] <= right[0]
          left.shift
        else
          right.shift
        end
      end
     
      result.concat(left).concat(right)
    end

    def snapshot!(part_a, part_b, array, offset_a=0, offset_b=0)
      @response[@i] = {
        part_a: (part_a.slice(offset_a..part_a.count)).to_s,
        part_b: (part_b.slice(offset_b..part_b.count)).to_s,
        array: array.to_s,
        offset_a: offset_a,
        offset_b: offset_b
      }
      @i += 1
    end
end
