$: << '.'
require 'robot'

robot = Robot.new
robot.follow_directives(File.readlines(ARGV[0]))
puts robot.report