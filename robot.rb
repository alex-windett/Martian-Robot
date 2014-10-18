class Robot

# Creating a new Robot
   $compass = {
    :north => "N",
    :east => "E",
    :south => "S",
    :west => "W"
  }

  attr_accessor :starting_x, :starting_y, :orientation, :movements

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
      elsif m == "R" 
        @orientation = :east
      end
    when :east
      if m == "L"
        @orientation = :north
      elsif m == "R"
        @orientation = :south
      end
    when :south
      if m == "L"
        @orientation = :east
      elsif m == "R" 
        @orientation = :west
      end
    when :west
      if m == "L"
        @orientation = :south
      elsif m == "R" 
        @orientation = :north
      end
    end
  end

  def move_forward 
    lost_positions = []

  # Add or minus 1 to X/Y co-oridnate depending on direction
  # robot will be moving
    case @orientation
    when :north 
      @starting_y += 1
        if @starting_y > $y_maximum
          lost_positions << @starting_y
          puts "Lost"
          
        end
    when :east
      @starting_x += 1
        if @starting_x > $x_maximum
          lost_positions << @starting_x
          puts "Lost"
          
        end
    when :south
      @starting_y -= 1
        if @starting_y < 0
          lost positions << @starting_y
          puts "Lost"
          
        end
    when :west
      @starting_x -= 1
      if @starting_x < 0
          lost positions << @starting_x
          puts "Lost"
          
        end
    end
    result
    binding.pry
  end

  def invalid_input
  # If letter is not one of three then raise error
    puts "This command has been ignore as it was an invalid letter"
  end

  def result
    puts "X = #{@starting_x}, Y = #{@starting_y}, Orientation = #{@orientation}"
  end 
end