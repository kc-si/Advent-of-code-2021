if __FILE__ == $0

  # Task:
  #
  #
  # For example:
  #
  # forward 5
  # down 5
  # forward 8
  # up 3
  # down 8
  # forward 2
  #
  # Your horizontal position and depth both start at 0. The steps above would then modify them as follows:
  #
  #     forward 5 adds 5 to your horizontal position, a total of 5.
  #     down 5 adds 5 to your depth, resulting in a value of 5.
  #     forward 8 adds 8 to your horizontal position, a total of 13.
  #     up 3 decreases your depth by 3, resulting in a value of 2.
  #     down 8 adds 8 to your depth, resulting in a value of 10.
  #     forward 2 adds 2 to your horizontal position, a total of 15.
  #
  # After following these instructions, you would have a horizontal position of 15 and a depth of 10.
  # (Multiplying these together produces 150.)
  #  -------------------------------------------------------------------------------------

  i = 0
  while i<5 do
      puts(' Type filename with extension if exist (or type EXIT if you want to quit) end press ENTER :')
      in_file = gets
      in_file = in_file.chop

      break if in_file == "exit"

      move_values = []

      if File.readable? (in_file)
        File.read(in_file).each_line {|line| move_values << line.chop}
        break
      else
          puts('Wrong filename or file not exist. Try again.')
          i += 1
          next
      end

  end

  if in_file != "exit" and File.readable? (in_file) then

    # main

      position = {horizontal: 0, depth: 0}

      move_values.each do |value|
      case
      when value.include?('forward') then position[:horizontal] += (value.delete"a-z").to_f
      when value.include?('down') then position[:depth] += (value.delete"a-z").to_f
      when value.include?('up') then position[:depth] -= (value.delete"a-z").to_f
      end
    end

    puts("Horizontal position : #{position[:horizontal]}, and depth : #{position[:depth]}.")
    puts("Multiply horizontal and depth : #{position[:horizontal] * position[:depth]} ")

  end

end
