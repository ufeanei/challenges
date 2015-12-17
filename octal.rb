
class Octal
	attr_accessor :octnum

	def initialize(num)
		@octnum = num
	end

	def not_valid?
		 octnum == '0' || octnum =~ /[A-Fa-f8-9]/
	end

	def to_decimal
		sum = 0
		return sum if not_valid?
		oct_reverse = octnum.reverse
		for i in 0...oct_reverse.size
			sum += oct_reverse[i].to_i* 8**i
		end
		sum
	end
end


