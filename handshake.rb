require 'pry'

class SecretHandshake
  attr_accessor :bin

  def initialize(num)
    @bin = num.to_i.to_s == '0' ? [] : num.to_i.to_s(2) # guard against 0, letter strings
  end

  

  def commands
    return bin if bin == []
    
    shake = []
    revbin = bin.reverse # using reverse! here produces weird results from line 45 to 48
    shake << 'wink' if revbin[0] =='1'
    shake << 'double blink' if revbin[1] == '1'
    shake << 'close your eyes' if revbin[2] == '1'
    shake << 'jump' if revbin[3] == '1'
    shake = ['jump', 'close your eyes', 'double blink','wink'] if revbin[4] == '1'

    shake
  end
end


    
  
  