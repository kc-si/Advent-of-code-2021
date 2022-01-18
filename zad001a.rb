if __FILE__ ==$0

<<<<<<< HEAD
  # Task:
=======
  # Tresc:
>>>>>>> d37d299b87a20f886020e676e3d75e5f2d59bb64
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
  # Start by comparing the first and second three-measurement windows. The measurements in the first window are marked A (199, 200, 208); their sum is 199 + 200 + 208 = 607. The second window is marked B (200, 208, 210); its sum is 618. The sum of measurements in the second window is larger than the sum of the first, so this first comparison increased.
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
  while i<5 do
      puts(' Type filename with extension if exist (or type EXIT if you want to quit) end press ENTER :')
      filee = gets
      filee = filee.chop

      break if filee == "exit"

      numbers = []

      if File.readable? (filee)
        File.read(filee).each_line {|line| numbers << line.to_f}
        break
      else
          puts('Wrong filename or file not exist. Try again.')
          i += 1
          next
      end

  end

  if filee != "exit" and File.readable? (filee) then


      #  puts("Numbers from file: \n #{numbers}")


    a = numbers[0]
    counter = 0

    i = 0
    j = 0

    puts("a.class: #{a.class}, a: #{a}")
    puts("counter.class: #{counter.class}, counter: #{counter}")

    numbers.each {|x|  counter+=1}
    puts("All numbers count: #{counter}")

    counter = 0



    while !numbers[j+3].nil? do
      if (numbers[j] + numbers[j+1] + numbers[j+2]) < (numbers[j+1] + numbers[j+2] + numbers[j+3])
        counter += 1
      end
        j += 1
    end

    puts("Increased numbers count:#{counter}")

  end

end
