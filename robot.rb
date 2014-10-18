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