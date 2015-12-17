require 'pry'

class Robot
  attr_accessor :xcor, :ycor, :orientation

  def at(x,y)
    @xcor = x
    @ycor = y
  end

  def orient(direction)
    if [:north, :east, :west, :south].include?(direction.to_sym)
      @orientation = direction.to_sym
    else
      raise "Drection must be east, west, south, north"
    end
  end

  def bearing
    orientation
  end

  def coordinates
    [xcor, ycor]
  end

  def turn_right
    self.orientation = :north if bearing == :west
    self.orientation = :east  if bearing == :north
    self.orientation = :south if bearing == :east
    self.orientation = :west  if bearing == :south
  end

  def turn_left
    self.orientation = :north if bearing == :east
    self.orientation = :east  if bearing == :south
    self.orientation = :south if bearing == :west
    self.orientation = :west  if bearing == :north
  end

  def advance
    self.xcor += 1 if bearing == :east
    self.xcor -= 1 if bearing == :west
    self.ycor += 1 if bearing == :north
    self.ycor -= 1 if bearing == :south
  end

end


class Simulator

  def place(rob, x, y, direction )
    rob.at(x,y)
    rob.orient(direction)
  end

  def wrong_command_message(let)
    puts "#{let.upcase} is not a valid robot command" if !['L', 'A', 'R'].include?(let.upcase)
  end


  def evaluate(rob, instruct) 
    inst = instruct.upcase.split(//)
    inst.each do |letter|
      wrong_command_message(letter) # robot throws an error for invalid commands and execute valid commands
      rob.turn_left if letter == 'L'
      rob.turn_right if letter == 'R'
      rob.advance if letter == 'A'
    end
  end

  def instruction(input)
    commands = []
    n = input.size
    for i in 0...n

      commands << :turn_right if input[i].upcase == 'R'
      commands << :turn_letf if input[i].upcase == 'L'
      commands << :advance if input[i].upcase == 'A'
      wrong_command_message(input[i])
    end
    commands
  end

end


robot1 = Robot.new
simulator = Simulator.new
simulator.place(robot1, 0, 0, 'west')

puts " enter your robot instruction"
answer = gets.chomp
puts "#{simulator.instruction(answer)}"
simulator.evaluate(robot1, answer)
puts "#{robot1.bearing}"
puts "#{robot1.coordinates}"



