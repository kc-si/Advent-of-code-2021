if __FILE__ == $0

  i = 0
  while i<5 do

    puts (' Type filename with extension .txt (or type EXIT if you want to quit) end press ENTER :')
    input = $stdin.gets # .to_s # roznica gets, STDIN.gets $stdin.gets

    break if input == "exit\n"

    # puts (input)

    file1 = File.open(input, 'r')   # ("/home/code/git001/test/#{input}", 'w')
    # puts file1

    numbers = [0,1]

    File.foreach(input) do |line|
      numbers << 9  # line
      puts ("#{line}")
    end

    puts ("#{numbers}")

    break if file1 != nil

      puts ("Can't open or No file for typed name.")


    # puts ("Liczby z pliku")
    # file1.each.with_index do |line|
    # puts ("#{line}")
    # end

    # File.foreach(file1).with_index do |line, line_num|
    #   puts "#{line_num}: #{line}"
    # end



    i += 1
  end

   puts ("Liczby z pliku")
    file1.each.with_index do |line|
    puts ("#{line}")
    end

    for line in file1                        # iteracja po liniach pliku
      puts line                             # wyswietla kazda linie
    end

  file1.close

end
