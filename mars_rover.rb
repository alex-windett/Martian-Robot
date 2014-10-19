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

      if
         # making sure that the data provided is correct
        mars_dimensions.empty?
          puts "please provide co-ordinates"
      elsif 
        binding.pry
        mars_dimensions[0] > 50 || mars_dimensions[1] > 50 || mars_dimensions[0] < 0 || mars_dimensions[1] < 0
          puts "Please provide valid co-ordinates (0 - 50)"
      else
        @mars =  Mars.new(mars_dimensions[0].to_i, mars_dimensions[1].to_i)
      end

    elsif answer == "2"
      puts "What are the robots Co-ords and Orientation (e.g. 1 1 e)"
        info = gets.chomp
        robot_data = info.split()
      puts "Enter instructions for your robot"
        robot_instructions = gets.chomp.upcase
      
        # making sure that the data provided is correct
        if robot_data[0].empty? || robot_data[1].empty? || robot_data[2].empty?
          puts "please provide valid coordinates and direction"
        elsif 
          robot_instructions.empty?
            puts "Please provide instructions"
        elsif 
          robot_instructions.split(//).count > 100 || robot_instructions.split(//).count < 0
          puts "Please give instructions greater than 0 but less than 100"
        else
          robot = Robot.new(robot_data[0].to_i, robot_data[1].to_i, robot_data[2].capitalize, robot_instructions).action
          @mars.robots << robot
        end

    else
      puts "Houston we have a problem, please try again"
    end

  answer = menu
  end