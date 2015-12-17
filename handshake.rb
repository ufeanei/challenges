require 'pry'

class SecrethHandshake
  attr_accessor :bin

  def initialize(num)
    @bin = num.to_i.to_s == '0' ? [] : num.to_i.to_s(2) # guard against 0, letter strings
  end

  def wrong_input_message
    puts "Input must be decimal number or decimal number string excluding zero"
  end

  def commands
    return wrong_input_message if bin == []
    
    handshake = []
    revbin = bin.reverse # using reverse! here produces weird results from line 45 to 48
    handshake << 'wink' if revbin[0] =='1'
    handshake << 'double blink' if revbin[1] == '1'
    handshake << 'close your eyes' if revbin[2] == '1'
    handshake << 'jump' if revbin[3] == '1'
    handshake = ['jump', 'close your eyes', 'double blink','wink'] if revbin[4] == '1'

    handshake
  end
end

c =SecrethHandshake.new(2)

puts c.bin

puts "#{c.commands}"

b = SecrethHandshake.new('4')

puts b.bin
puts "#{b.commands}"

a = SecrethHandshake.new(0)

puts a.bin
puts "#{a.commands}"
puts "#{a.commands}"
puts "#{a.commands}"
puts "#{a.commands}"

binding.pry
  
    
  
  