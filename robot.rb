$x_lost_positions = []
$y_lost_positions = []

class Robot

   @@compass = {
    :north => "N",
    :east => "E",
    :south => "S",
    :west => "W"
  }
  # Class variable with a hash of compass directions
  # correlating to user input.

  attr_accessor :starting_x, :starting_y, :orientation, :movements

  def initialize(x, y, orientation, movements)
    @starting_x = x
    @starting_y = y
    @orientation = @@compass.key(orientation)
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
        error
      end
    end
  end

  def error
  # If letter is not one of three then raise error
    puts "This command has been ignored as it was an invalid letter"
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

  # Add or minus 1 to X/Y co-oridnate depending on direction
  # robot will be moving
  # If statements checking max/min val of grid
  # and if there have been lost robots before. 
  # Relevant methods are then called.
    case @orientation
    when :north 
      @starting_y += 1
        if $y_lost_positions.include? @starting_y
          lost_robot_scent
        elsif @starting_y > $y_maximum
          lost_y_coord
        end
    when :east
      @starting_x += 1
        if $x_lost_positions.include? @starting_x
          lost_robot_scent
        elsif @starting_x > $x_maximum
          lost_x_coord        
        end
    when :south
      @starting_y -= 1
        if $y_lost_positions.include? @starting_y
          lost_robot_scent  
        elsif @starting_y < 0
          lost_y_coord
        end
    when :west
      @starting_x -= 1
      if $x_lost_positions.include? @starting_x
          lost_robot_scent
      elsif @starting_x < 0
          lost_x_coord 
      end
    end
    result
  end

  def lost_x_coord
  # put lost x cooridantes into empty array
    puts "Lost"
    $x_lost_positions << @starting_x 
  end

  def lost_y_coord
  # put lost y cooridantes into empty array
    puts "Lost"
    $y_lost_positions << @starting_y
  end

  def lost_robot_scent
    puts "Lost robots have gone that way, don't want to go there"
  end


  def result
    puts "#{@starting_x} #{@starting_y} #{@orientation.capitalize}"
  end 
end