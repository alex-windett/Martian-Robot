require 'pry-byebug' 

require_relative "mars"
require_relative "robot"


def create_mars
  puts "What is the length of Mars (X value)?"
  mars_x = gets.chomp.to_i
  puts "What is the height of Mars (Y value)?"
  mars_y = gets.chomp.to_i
  
  @mars =  Mars.new(mars_x, mars_y)
end

def create_robot
  puts "What is the starting x value your Robot?"
  robot_x = gets.chomp.to_i
  puts "What is the starting y value your Robot?"
  robot_y = gets.chomp.to_i
  puts "What compass direction is he facing? (N, S, W, E)"
  robot_orientation = gets.chomp.to_s.capitalize
  puts "Enter instructions for your robot"
  robot_instructions = gets.chomp.upcase

  @mars.robots << robot
  
  robot = Robot.new(robot_x, robot_y, robot_orientation, robot_instructions).action
end

binding.pry