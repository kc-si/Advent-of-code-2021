if __FILE__ == $0

  i = 0
  while i<5 do

    puts (" Type filename with extension .txt (or type EXIT if you want to quit) end press ENTER :")
    input = gets.to_s

    break if input == "exit\n"

    puts (input)

    file1 = File.open(input), "r"
    numbers = []

    File.foreach(input) do |line|
      numbers << line
    end

    puts (numbers.to_a)

    break if file1 != nil
      puts ("Can't open or No file for typed name.")


    # puts ("Liczby z pliku")
    # file.each.with_index do |line|
    # puts ("#{line}")
    # end

    # File.foreach(file1).with_index do |line, line_num|
      # puts "#{line_num}: #{line}"
    # end


    # for line in file                        # iteracja po liniach pliku
    # puts line                             # wyswietla kazda linie
    # end
    i+=1
  end

  file1.close

end
