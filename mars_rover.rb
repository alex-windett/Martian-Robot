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
      puts "What is the length of Mars (X value)?"
      mars_x = gets.chomp.to_i
      puts "What is the height of Mars (Y value)?"
      mars_y = gets.chomp.to_i

      @mars =  Mars.new(mars_x, mars_y)
    elsif answer == "2"
      puts "coords and orientation"
      info = gets.chomp
      robot_data = info.split()
      binding.pry
      # puts "What is the starting x value your Robot?"
      # robot_x = gets.chomp.to_i
      # puts "What is the starting y value your Robot?"
      # robot_y = gets.chomp.to_i
      # puts "What compass direction is he facing? (N, S, W, E)"
      # robot_orientation = gets.chomp.to_s.capitalize
      puts "Enter instructions for your robot"
      robot_instructions = gets.chomp.upcase
      
      robot = Robot.new(robot_data[0], robot_data[1], robot_data[2], robot_instructions).action

      @mars.robots << robot
    else
      puts "Houston we have a problem"
    end
  answer = menu
  end

# def create_mars
#   puts "What is the length of Mars (X value)?"
#   mars_x = gets.chomp.to_i
#   puts "What is the height of Mars (Y value)?"
#   mars_y = gets.chomp.to_i
  
#   @mars =  Mars.new(mars_x, mars_y)
# end

# def create_robot
#   puts "What is the starting x value your Robot?"
#   robot_x = gets.chomp.to_i
#   puts "What is the starting y value your Robot?"
#   robot_y = gets.chomp.to_i
#   puts "What compass direction is he facing? (N, S, W, E)"
#   robot_orientation = gets.chomp.to_s.capitalize
#   puts "Enter instructions for your robot"
#   robot_instructions = gets.chomp.upcase

#   @mars.robots << robot
  
#   robot = Robot.new(robot_x, robot_y, robot_orientation, robot_instructions).action
# end

# binding.pry