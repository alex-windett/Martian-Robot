require 'pry-byebug' 

require_relative "mars"
require_relative "robot"


def menu
  `clear`
  puts "1 for new mars, 2 for new robot"

  gets.chomp
end

answer = menu
 while answer != "3"
    if answer == "1"
      puts "Dimensions of Mars (e.g. 5 3)"
        size = gets.chomp
        mars_dimensions = size.split()

      @mars =  Mars.new(mars_dimensions[0], mars_dimensions[1])
    elsif answer == "2"
      puts "What are the robots Co-ords and Orientation (e.g. 1 1 e)"
        info = gets.chomp
        robot_data = info.split()
      puts "Enter instructions for your robot"
        robot_instructions = gets.chomp.upcase
      
      robot = Robot.new(robot_data[0].to_i, robot_data[1].to_i, robot_data[2].capitalize, robot_instructions).action

      @mars.robots << robot
    else
      puts "Houston we have a problem"
    end
  answer = menu
  end