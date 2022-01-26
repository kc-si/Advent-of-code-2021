require "./lib/read_file"

# Task
# Next, you should verify the life support rating, which can be determined by multiplying the oxygen generator rating
# by the CO2 scrubber rating.
# onsider just the first bit of those numbers. Then:
#
#     Keep only numbers selected by the bit criteria for the type of rating value for which you are searching.
#     Discard numbers which do not match the bit criteria.
#     If you only have one number left, stop; this is the rating value for which you are searching.
#     Otherwise, repeat the process, considering the next bit to the right.
#
# The bit criteria depends on which type of rating value you want to find:
#
#     To find oxygen generator rating, determine the most common value (0 or 1) in the current bit position,
#     and keep only numbers with that bit in that position. If 0 and 1 are equally common, keep values with a 1 in the
#     position being considered.
#     To find CO2 scrubber rating, determine the least common value (0 or 1) in the current bit position, and keep
#     only numbers with that bit in that position. If 0 and 1 are equally common, keep values with a 0 in the position
#     being considered.
#
# For example, to determine the oxygen generator rating value using the same example diagnostic report from above:
#
#     Start with all 12 numbers and consider only the first bit of each number. There are more 1 bits (7)
#     than 0 bits (5), so keep only the 7 numbers with a 1 in the first position: 11110, 10110, 10111, 10101, 11100,
#     10000, and 11001.
#     Then, consider the second bit of the 7 remaining numbers: there are more 0 bits (4) than 1 bits (3), so keep
#     only the 4 numbers with a 0 in the second position: 10110, 10111, 10101, and 10000.
#     In the third position, three of the four numbers have a 1, so keep those three: 10110, 10111, and 10101.
#     In the fourth position, two of the three numbers have a 1, so keep those two: 10110 and 10111.
#     In the fifth position, there are an equal number of 0 bits and 1 bits (one each). So, to find the oxygen
#     generator rating, keep the number with a 1 in that position: 10111.
#     As there is only one number left, stop; the oxygen generator rating is 10111, or 23 in decimal.
#
# Then, to determine the CO2 scrubber rating value from the same example above:
#
#     Start again with all 12 numbers and consider only the first bit of each number. There are fewer 0 bits (5)
#     than 1 bits (7), so keep only the 5 numbers with a 0 in the first position: 00100, 01111, 00111, 00010, and 01010.
#     Then, consider the second bit of the 5 remaining numbers: there are fewer 1 bits (2) than 0 bits (3), so keep
#     only the 2 numbers with a 1 in the second position: 01111 and 01010.
#     In the third position, there are an equal number of 0 bits and 1 bits (one each). So, to find the CO2 scrubber
#     rating, keep the number with a 0 in that position: 01010.
#     As there is only one number left, stop; the CO2 scrubber rating is 01010, or 10 in decimal.
#
# Finally, to find the life support rating, multiply the oxygen generator rating (23) by the CO2 scrubber rating (10)
# to get 230.
#
# Use the binary numbers in your diagnostic report to calculate the oxygen generator rating and CO2 scrubber rating,
# then multiply them together. What is the life support rating of the submarine? (Be sure to represent your
# answer in decimal, not binary.)

def parse_input(input_data)
  binary_diagnostic_report = input_data.split.map {|binary_value| binary_value.chars}
end

def find_common(binary_diagnostic_report, bit_position)
  most_common = 0

  binary_diagnostic_report.each do |value|
    case value[bit_position].to_i
    when 1 then most_common += 1
    when 0 then most_common -= 1
    end
  end

  if most_common >= 0
    most_common = "1"
  else
    most_common = "0"
  end
  most_common
end

def bit_criteria(binary_diagnostic_report, common)
  bit_position = 0

  if binary_diagnostic_report.size > 1
    most_common = find_common(binary_diagnostic_report, bit_position)

    case common
    when "most" then  binary_report = binary_diagnostic_report.reject {|value| value[bit_position] != most_common}
    when "least" then binary_report = binary_diagnostic_report.reject {|value| value[bit_position] == most_common}
    end

    bit_position += 1

    while (binary_report.size > 1 && bit_position < binary_diagnostic_report[0].size) do
      most_common = find_common(binary_report, bit_position)

      case common
      when "most" then  binary_report.reject! {|value| value[bit_position] != most_common}
      when "least" then binary_report.reject! {|value| value[bit_position] == most_common}
      end

      bit_position += 1
    end
  elsif binary_diagnostic_report.size == 1
    binary_report = binary_diagnostic_report
  else
    binary_report = [["0"]]
  end

  binary_report[0].join
end

def calculate_rating(binary_diagnostic_report)
  rating = {oxygen_generator_rating: 0 , co2_scrubber_rating: 0 }

  rating[:oxygen_generator_rating] = bit_criteria(binary_diagnostic_report, "most")
  rating[:co2_scrubber_rating] = bit_criteria(binary_diagnostic_report, "least")

  rating
end

def calculate_life_support_rating(input_data)
  binary_diagnostic_report = parse_input(input_data)

  rating = calculate_rating(binary_diagnostic_report)

  rating[:oxygen_generator_rating].to_i(2) * rating[:co2_scrubber_rating].to_i(2)
end


if __FILE__ == $0

  #  main

  input_data = read_file
  return if input_data.nil?

  answer = calculate_life_support_rating(input_data)
  puts("Answer : #{answer} ")

end
