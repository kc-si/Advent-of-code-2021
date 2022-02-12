if __FILE__ == $0

  # Tresc zadania:
  # In the above example, the sum of each three-measurement window is as follows:

  # A: 607 (N/A - no previous sum)
  # B: 618 (increased)
  # C: 618 (no change)
  # D: 617 (decreased)
  # E: 647 (increased)
  # F: 716 (increased)
  # G: 769 (increased)
  # H: 792 (increased)

  # In this example, there are 5 sums that are larger than the previous sum.

  # Consider sums of a three-measurement sliding window. How many sums are larger than the previous sum?
  # Koniec tresci. -----------------------------------------------------------------------------------

  numbers = []

  # File.readable? (input) do
  File.read('input1').each_line { |line| numbers << line.to_f }

  #  puts("Numbers from file: \n #{numbers}")

  a = numbers[0]
  counter = 0

  puts("a.class: #{a.class}, a: #{a}")
  puts("i.class: #{counter.class}, a: #{counter}")

  numbers.each { counter += 1 }
  puts("All numbers count: #{counter}")

  counter = 0

  numbers.each do |x|
    if x > a
      counter += 1
      a = x
    else
      a = x
    end
  end

  puts("Increased numbers caount:#{counter}")

end
