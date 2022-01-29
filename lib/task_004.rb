require_relative './read_file.rb'

# The submarine has a bingo subsystem to help passengers (currently, you and the giant squid) pass the time.
#  It automatically generates a random order in which to draw numbers and a
#  random set of boards (your puzzle input). For example:
#
# 7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1
#
# 22 13 17 11  0
#  8  2 23  4 24
# 21  9 14 16  7
#  6 10  3 18  5
#  1 12 20 15 19
#
#  3 15  0  2 22
#  9 18 13 17  5
# 19  8  7 25 23
# 20 11 10 24  4
# 14 21 16 12  6
#
# 14 21 17 24  4
# 10 16 15  9 19
# 18  8 23 26 20
# 22 11 13  6  5
#  2  0 12  3  7
#
# After the first five numbers are drawn (7, 4, 9, 5, and 11), there are no winners, but the boards are
# marked as follows (shown here adjacent to each other to save space):
#
# 22 13 17 11  0         3 15  0  2 22        14 21 17 24  4
#  8  2 23  4 24         9 18 13 17  5        10 16 15  9 19
# 21  9 14 16  7        19  8  7 25 23        18  8 23 26 20
#  6 10  3 18  5        20 11 10 24  4        22 11 13  6  5
#  1 12 20 15 19        14 21 16 12  6         2  0 12  3  7
#
# After the next six numbers are drawn (17, 23, 2, 0, 14, and 21), there are still no winners:
#
# 22 13 17 11  0         3 15  0  2 22        14 21 17 24  4
#  8  2 23  4 24         9 18 13 17  5        10 16 15  9 19
# 21  9 14 16  7        19  8  7 25 23        18  8 23 26 20
#  6 10  3 18  5        20 11 10 24  4        22 11 13  6  5
#  1 12 20 15 19        14 21 16 12  6         2  0 12  3  7
#
# Finally, 24 is drawn:
#
# 22 13 17 11  0         3 15  0  2 22        14 21 17 24  4
#  8  2 23  4 24         9 18 13 17  5        10 16 15  9 19
# 21  9 14 16  7        19  8  7 25 23        18  8 23 26 20
#  6 10  3 18  5        20 11 10 24  4        22 11 13  6  5
#  1 12 20 15 19        14 21 16 12  6         2  0 12  3  7
#
# At this point, the third board wins because it has at least one complete row or column of marked
# numbers (in this case, the entire top row is marked: 14 21 17 24 4).
#
# The score of the winning board can now be calculated. Start by finding the sum of all unmarked
# numbers on that board; in this case, the sum is 188. Then, multiply that sum by the number that was just
#   called when the board won, 24, to get the final score, 188 * 24 = 4512.
#
# To guarantee victory against the giant squid, figure out which board will win first. What will your
# final score be if you choose that board?

def parse_input(input_data)
  [input_data.split[0].split(',').map{ |variable| variable.to_i }].concat(
    [input_data.split[1...nil].map{ |variable| variable.to_i }.each_slice(5).to_a.each_slice(5).to_a])
end

def check_board(numbers, board)
  board.each do |ary|
    if ary.select { |value| numbers.include?(value) }.size == 5
      return 1
    end
  end
  5.times do |j|
    temp = []
    5.times do |i|
      temp << board[i][j]
      if temp.select { |value| numbers.include?(value) }.size == 5
        return 1
      end
    end
  end
  nil
end

def find_winners(puzzle_input)
  results = {winners: [], numbers_drawn: 0}
  puzzle_input[0].size.times do |numbers_drawn|
    puzzle_input[1].size.times do |board_number|
      results[:winners] << board_number if check_board(puzzle_input[0][0..numbers_drawn],puzzle_input[1][board_number])
      if results[:winners].size >= 1
        results[:numbers_drawn] = numbers_drawn
        return results
      end
    end
  end
  nil
end

def sum_unmarked_numbers(puzzle_input, results)
  sum = 0
  puzzle_input[1][results[:winners][0]].each do |numbers|
    numbers.each do |value|
      sum += value unless puzzle_input[0][0..results[:numbers_drawn]].include?(value)
    end
  end
  sum
end

def calculate_answer(puzzle_input)
  results = find_winners(puzzle_input)

  if results[:winners].size > 1
    puts("Indefinite result : #{results[:winners].size} winners.")
  else
    sum_unmarked_numbers(puzzle_input, results) * puzzle_input[0][results[:numbers_drawn]]
  end
end



if __FILE__ == $0

  input_data = read_file
  return if input_data.nil?

  puzzle_input = parse_input(input_data)

  answer = calculate_answer(puzzle_input)
  puts("Answer : #{answer}")
end
