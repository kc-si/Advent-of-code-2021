# Task:
#
#
# For example:
#
# forward 5
# down 5
# forward 8
# up 3
# down 8
# forward 2
#
# Your horizontal position and depth both start at 0. The steps above would then modify them as follows:
#
#     forward 5 adds 5 to your horizontal position, a total of 5.
#     down 5 adds 5 to your depth, resulting in a value of 5.
#     forward 8 adds 8 to your horizontal position, a total of 13.
#     up 3 decreases your depth by 3, resulting in a value of 2.
#     down 8 adds 8 to your depth, resulting in a value of 10.
#     forward 2 adds 2 to your horizontal position, a total of 15.
#
# After following these instructions, you would have a horizontal position of 15 and a depth of 10.
# (Multiplying these together produces 150.)
#  -------------------------------------------------------------------------------------

def read_file
  puts(' Type filename with extension if exist (or type EXIT if you want to quit) end press ENTER :')
  input_file = gets
  input_file = input_file.chop

  return if input_file == 'exit'

  if File.readable?(input_file)
    input_data = File.read(input_file)
  else
    puts('Wrong filename or file not exist.')
  end
end

def parse_input(input_data)
  steps = []

  lines = input_data.split("\n")

  lines.each do |line|
    direction = line.split(' ')[0].to_sym
    distance = line.split(' ')[1].to_i

    steps << { direction:, distance: }
  end

  steps
end

def calculate_position(initial_position, steps)
  position = initial_position

  steps.each do |step|
    case step[:direction]
      when :forward then position[:horizontal] += step[:distance]
      when :down then position[:depth] += step[:distance]
      when :up then position[:depth] -= step[:distance]
    end
  end

  position
end

def calculate_answer(input_data, initial_position = { horizontal: 0, depth: 0 })
  steps = parse_input(input_data)
  final_position = calculate_position(initial_position, steps)
  final_position[:horizontal] * final_position[:depth]
end

if __FILE__ == $0

  # main
  input_data = read_file
  return if input_data.nil?

  answer = calculate_answer(input_data) #  initial_position = {horizontal: 0, depth: 0}

  puts("Answer : #{answer} ")
end
