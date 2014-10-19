class Mars 

  attr_accessor :maximum_x, :maximum_y, :robots

  def initialize(x, y)
  # Creating instance variables of the x/y value to be
  # maximum values of the grid
    $x_maximum = x
    $y_maximum = y
    # global variables to be accessed in the robot class
    @robots = []

    if $x_maximum > 50 || $y_maximum > 50 || $x_maximum < 0 || $y_maximum < 0
      `clear`
      puts "Please provide valid co-ordinates (0 - 50)"
    end
  end

end