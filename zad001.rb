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


  puts(' Type filename with extension .txt (or type EXIT if you want to quit) end press ENTER :')
  filee = gets # .to_s # roznica gets, STDIN.gets $stdin.gets


  # break if input == "exit\n"

  numbers = []

  # File.readable? (input) do
    File.read("input").each_line {|line| numbers << line.to_f}


  #  puts("Numbers from file: \n #{numbers}")


  a = numbers[0]
  i = 0
  @i = i

  puts ("a.class: #{a.class}, a: #{a}")
  puts ("i.class: #{i.class}, a: #{i}")

  numbers.each {|x|  i+=1}
  puts ("All numbers count: #{i}")



  # block_1{
    # i+=1
    # a=x
  # }

    # def increase1(a,x)
      # a=x
      # @i += 1

    # end

    i = 0

  numbers.each { |x| if x>a then i+=1   # main
  a=x else a=x end }


  puts ("Increased numbers caount:#{i}")

end
