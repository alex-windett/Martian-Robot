require 'pry-byebug' 

class Mars 
  # Creating a new Mars planet

  attr_accessor :maximum_x, :maximum_y, :robots

  def initialize(x, y)
    # Creating instance variables of the x/y value to be
    # maximum values of the grid
    @x_maximum = x
    @y_maximum = y
    @robots = []
  end

end


class Robot

  attr_accessor :starting_x, :starting_y

  def initialize(x, y)
    @starting_x = x
    @starting_y = y
  end

end

board_1 = Mars.new(5, 3)
robot_1 = Robot.new(1, 1)

board_1.robots << robot_1
binding.pry