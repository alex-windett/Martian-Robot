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
# Creating a new Robot
   $compass = {
    :north => "N",
    :east => "E",
    :south => "S",
    :west => "W"
  }

  attr_accessor :starting_x, :starting_y

  def initialize(x, y, orientation, movements)
    @starting_x = x
    @starting_y = y
    @orientation = $compass.key(orientation)
    @movements = movements
  end

  def action
  # Split each of the actions, iterate over each one 
  # and determine which method should now be performed
    movement = @movements.upcase.split(//)
    movement.each do |m|
      if m == "L" || m == "R"
        turn(m)
      elsif m == "F"
       move_forward
      else 
        invalid_input
      end
    end
  end

  def turn(m)
  # take the orientation, for example, when facing north and 
  # direction is "L", now orientated west. 
  # Repeated for each occurance
    case @orientation
    when :north
      if m == "L"
        @orientation = :west
      elsif 
        @orientation = :east
      end
    when :east
      if m == "L"
        @orientation = :north
      elsif 
        @orientation = :south
      end
    when :south
      if m == "L"
        @orientation = :east
      elsif 
        @orientation = :west
      end
    when :west
      if m == "L"
        @orientation = :south
      elsif 
        @orientation = :north
      end
    end
  end

  def move_forward 
  # Add or minus 1 to X/Y co-oridnate depending on direction
  # robot will be moving
    case @orientation
    when :north 
      @starting_y += 1
    when :east
      @starting_x += 1
    when :south
      @starting_y -= 1
    when :west
      @starting_x -= 1
    end
    puts "X = #{@starting_x}, Y = #{@starting_y}"
  end

  def invalid_input
  # If letter is not one of three then raise error
    puts "This command has been ignore as it was an invalid letter"
  end

end

def menu
  puts `clear`

  puts "Press 1 to create or alter the size of Mars, press 2 to send of a new robot or 3 to quite"

  gets.chomp
end

response = menu

while response != "3"
  if response = "1"
    puts "What is the length of Mars (X value)?"
    mars_x = gets.chomp.to_i
    puts "What is the height of Mars (Y value)?"
    mars_y = gets.chomp.to_i

    board_1 = Mars.new(mars_x, mars_y)
  elsif response = "2"
    puts "What is the starting x value your Robot?"
    robot_x = gets.chomp.to_i
    puts "What is the starting y value your Robot?"
    robot_y = gets.chomp.to_i
    puts "What compass direction is he facing? (N, S, W, E)"
    robot_orientation = gets.chomp.to_s
    puts "Enter instructions for your robot"
    @obot_instructions = gets.chomp

    robot_1 = Robot.new(robot_x, robot_y, robot_orientation, robot_instructions)

    board_1.robots << robot_1
  end

  response = menu
end

binding.pry