if __FILE__ == $0

  # Task:
  #
  #
  # Instead, consider sums of a three-measurement sliding window. Again considering the above example:
  #
  # 199  A
  # 200  A B
  # 208  A B C
  # 210    B C D
  # 200  E   C D
  # 207  E F   D
  # 240  E F G
  # 269    F G H
  # 260      G H
  # 263        H
  #
  # Start by comparing the first and second three-measurement windows. The measurements in the first window are
  # marked A (199, 200, 208); their sum is 199 + 200 + 208 = 607. The second window is marked B (200, 208, 210);
  # its sum is 618. The sum of measurements in the second window is larger than the sum of the first, so this first
  # comparison increased.
  #
  # Your goal now is to count the number of times the sum of measurements in this sliding window increases from the previous sum. So, compare A with B, then compare B with C, then C with D, and so on. Stop when there aren't enough measurements left to create a new three-measurement sum.
  #
  # In the above example, the sum of each three-measurement window is as follows:
  #
  # A: 607 (N/A - no previous sum)
  # B: 618 (increased)
  # C: 618 (no change)
  # D: 617 (decreased)
  # E: 647 (increased)
  # F: 716 (increased)
  # G: 769 (increased)
  # H: 792 (increased)
  #
  # In this example, there are 5 sums that are larger than the previous sum.
  #
  # Consider sums of a three-measurement sliding window. How many sums are larger than the previous sum?
  # ----------------------------------------------------------------

  i = 0
  while i < 5
    puts(' Type filename with extension if exist (or type EXIT if you want to quit) end press ENTER :')
    in_file = gets
    in_file = in_file.chop

    break if in_file == 'exit'

    numbers = []

    if File.readable?(in_file)
      File.read(in_file).each_line { |line| numbers << line.to_f }
      break
    else
      puts('Wrong filename or file not exist. Try again.')
      i += 1
      next
    end

  end

  if in_file != 'exit' and File.readable?(in_file)

    puts("The number of all measurements: #{numbers.count}")

    # main

    counter = 0

    WINDOWSIZE = 3

    last_left_window_beginning = numbers.count - WINDOWSIZE - 1

    (0..last_left_window_beginning).each do |left_window_beginning|
      if numbers[left_window_beginning] < numbers[left_window_beginning + WINDOWSIZE]
        counter += 1
      end
    end

    puts("Sums of 3 larger than previous : #{counter}")

  end

end
