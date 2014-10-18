class Mars 

  attr_accessor :maximum_x, :maximum_y, :robots

  def initialize(x, y)
  # Creating instance variables of the x/y value to be
  # maximum values of the grid
    $x_maximum = x
    $y_maximum = y
    # variables to be accessed in the robot class
    @robots = []
  end

end