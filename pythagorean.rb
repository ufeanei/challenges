class Triplet
  attr_accessor :a, :b, :c

  def self.where(input)
    max = input[:max_factor]
    min = input[:min_factor] || 1
    sum = input[:sum]

    triplets = []

    num_arr = (min..max).to_a
    num_arr.combination(3) do |comb|
      triple = Triplet.new(comb[0], comb[1], comb[2])
      if sum 
        triplets << triple if triple.pythagorean? && triple.sum == sum
      else
        triplets << triple if triple.pythagorean? 
      end
    end
    triplets
  end

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def sum
    a + b + c
  end

  def product
    a*b*c
  end

  def pythagorean?
    a*a + b*b == c*c
  end
end

z = Triplet.where(max_factor: 100, sum: 180)

 a = z.map(&:product)


puts "#{a}"

    