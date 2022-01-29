require_relative './read_file.rb'

# Task:
#
# 00100
# 11110
# 10110
# 10111
# 10101
# 01111
# 00111
# 11100
# 10000
# 11001
# 00010
# 01010
#
# Considering only the first bit of each number, there are five 0 bits and seven 1 bits. Since the most
# common bit is 1, the first bit of the gamma rate is 1.
#
# The most common second bit of the numbers in the diagnostic report is 0, so the second bit of the gamma rate is 0.
#
# The most common value of the third, fourth, and fifth bits are 1, 1, and 0, respectively, and so the
# final three bits of the gamma rate are 110.
#
# So, the gamma rate is the binary number 10110, or 22 in decimal.
#
# The epsilon rate is calculated in a similar way; rather than use the most common bit, the least common bit
# from each position is used. So, the epsilon rate is 01001, or 9 in decimal. Multiplying the gamma rate (22)
# by the epsilon rate (9) produces the power consumption, 198.
#
# Use the binary numbers in your diagnostic report to calculate the gamma rate and epsilon rate, then multiply
# them together. What is the power consumption of the submarine? (Be sure to represent your
# answer in decimal, not binary.)
#  -------------------------------------------------------------------------------------

def parse_input(input_data)
  binary_diagnostic_report = []

  input_data.split("\n").each do |binary_value|
    binary_diagnostic_report << binary_value.each_char.to_a
  end
  binary_diagnostic_report
end

def count_gamma_epsilon_rate(binary_diagnostic_report)
  gamma_rate = ""
  epsilon_rate = ""

  rate = 0
  bit_position = 0

  binary_diagnostic_report[0].size.times do
    binary_diagnostic_report.each do |value|
      case value[bit_position].to_i
      when 1 then rate += 1
      when 0 then rate -= 1
      end
    end

    if rate <= 0
      gamma_rate << "0"
      epsilon_rate << "1"
    else
      gamma_rate << "1"
      epsilon_rate << "0"
    end

    rate = 0
    bit_position += 1
  end
  rates = {gamma_rate: gamma_rate, epsilon_rate: epsilon_rate}
end

def calculate_power_consumption(input_data)
  binary_diagnostic_report = parse_input(input_data)
  rates = count_gamma_epsilon_rate(binary_diagnostic_report)
  rates[:gamma_rate].to_i(2) * rates[:epsilon_rate].to_i(2)
end

if __FILE__ == $0

  #  main

  input_data = read_file
  return if input_data.nil?

  answer = calculate_power_consumption(input_data)
  puts("Answer : #{answer} ")

end
