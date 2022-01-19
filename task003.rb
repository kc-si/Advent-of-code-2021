if __FILE__ == $0

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

  i = 0
  while i<5 do
    puts(' Type filename with extension if exist (or type EXIT if you want to quit) end press ENTER :')
    input_file = gets
    input_file = input_file.chop

    break if input_file == "exit"

    binary_diagnostic_report = []

    if File.readable? (input_file)
      File.read(input_file).each_line {|line| binary_diagnostic_report << line.chop}
      break
    else
        puts('Wrong filename or file not exist. Try again.')
        i += 1
        next
    end

  end

  i = 0
  j = 0

  gamma_rate = ""
  epsilon_rate = ""

  puts("Bin size : #{binary_diagnostic_report[0].size}")


  if input_file != "exit" and File.readable? (input_file) then

    # main

    (binary_diagnostic_report[0].size).times do

      binary_diagnostic_report.each do |value|

        if value[j].to_i == 1
          i += 1
        else
          i -= 1
        end

      end

      if i <= 0
        gamma_rate << "0"
        epsilon_rate << "1"
      else
        gamma_rate << "1"
        epsilon_rate << "0"
      end


      i = 0
      j += 1

    end

    power_consumption = gamma_rate.to_i(2) * epsilon_rate.to_i(2)
    puts("Gamma rate: #{gamma_rate}, epsilon_rate : #{epsilon_rate}.",)
    puts("Power consumption : #{power_consumption} ")

  end

end
