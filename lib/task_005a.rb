require_relative 'read_file'

# They tend to form in lines; the submarine helpfully produces a list of nearby lines of vents (your puzzle input)
# for you to review. For example:
#
# 0,9 -> 5,9
# 8,0 -> 0,8
# 9,4 -> 3,4
# 2,2 -> 2,1
# 7,0 -> 7,4
# 6,4 -> 2,0
# 0,9 -> 2,9
# 3,4 -> 1,4
# 0,0 -> 8,8
# 5,5 -> 8,2
#
# Each line of vents is given as a line segment in the format x1,y1 -> x2,y2 where x1,y1 are the coordinates of
# one end the line segment and x2,y2 are the coordinates of the other end. These line segments include the points
# at both ends. In other words:
#
#     An entry like 1,1 -> 1,3 covers points 1,1, 1,2, and 1,3.
#     An entry like 9,7 -> 7,7 covers points 9,7, 8,7, and 7,7.
#
# For now, only consider horizontal and vertical lines: lines where either x1 = x2 or y1 = y2.
#
# So, the horizontal and vertical lines from the above list would produce the following diagram:
#
# .......1..
# ..1....1..
# ..1....1..
# .......1..
# .112111211
# ..........
# ..........
# ..........
# ..........
# 222111....
#
# In this diagram, the top left corner is 0,0 and the bottom right corner is 9,9. Each position is shown as the
# number of lines which cover that point or . if no line covers that point. The top-left pair of 1s, for example,
# comes from 2,2 -> 2,1; the very bottom row is formed by the overlapping lines 0,9 -> 5,9 and 0,9 -> 2,9.
#
# To avoid the most dangerous areas, you need to determine the number of points where at least two lines overlap.
#  In the above example, this is anywhere in the diagram with a 2 or larger - a total of 5 points.
#
# Consider horizontal and vertical lines. At how many points do at least two lines overlap?
#
# Unfortunately, considering only horizontal and vertical lines doesn't give you the full picture;
# you need to also consider diagonal lines.
#
# Because of the limits of the hydrothermal vent mapping system, the lines in your list will only
# ever be horizontal, vertical, or a diagonal line at exactly 45 degrees.

def parse_input(input_data)
  input_data.split("\n").map { |line| parse_line(line) }
end

def parse_line(line)
  point1, point2 = line.split(' -> ')

  {
    point1: parse_point(point1),
    point2: parse_point(point2),
  }
end

def parse_point(point)
  point.split(',').map { |value| value.to_i }
end

def mark_lines(lines)
  diagram = {}
  lines.each { |line| mark_line(line, diagram) }
  diagram
end

def mark_line(line, diagram)
  if line[:point1][0] == line[:point2][0] || line[:point1][1] == line[:point2][1]
    x1, x2 = [line[:point1][0], line[:point2][0]].sort
    y1, y2 = [line[:point1][1], line[:point2][1]].sort
    (x1..x2).each do |x|
      (y1..y2).each do |y|
        diagram.key?("#{x},#{y}") ? diagram["#{x},#{y}"] += 1 : diagram.store("#{x},#{y}", 1)
      end
    end
  end

  if (line[:point1][0] - line[:point2][0]).abs == (line[:point1][1] - line[:point2][1]).abs
    x1, x2 = [line[:point1][0], line[:point2][0]].sort
    y1, y2 = [line[:point1][1], line[:point2][1]].sort

    x = line[:point1][0] - line[:point2][0] < 0 ? (x1..x2).each.to_a : (x1..x2).each.to_a.reverse
    y = line[:point1][1] - line[:point2][1] < 0 ? (y1..y2).each.to_a : (y1..y2).each.to_a.reverse

    x.size.times do |i|
      diagram.key?("#{x[i]},#{y[i]}") ? diagram["#{x[i]},#{y[i]}"] += 1 : diagram.store("#{x[i]},#{y[i]}", 1)
    end
  end
  diagram
end

def calculate_answer(diagram)
  sum = 0
  diagram.each_value { |value| value >= 2 ? sum += 1 : nil }
  sum
end

if __FILE__ == $0

  input_data = read_file
  return if input_data.nil?

  lines = parse_input(input_data)

  diagram = mark_lines(lines)

  answer = calculate_answer(diagram)
  puts("Answer: #{answer}")
end
