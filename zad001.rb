if __FILE__ == $0

  puts (' Type filename with extension .txt (or type EXIT if you want to quit) end press ENTER :')
  input = gets # .to_s # roznica gets, STDIN.gets $stdin.gets


  # break if input == "exit\n"

  numbers = []

  # File.readable? (input) do
    File.read("numbers.txt").each_line {|line| numbers << line.to_f}


  puts("Numbers from file: \n #{numbers}")

end
