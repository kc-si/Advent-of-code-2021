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
      input_file = gets
      input_file = input_file.chop

      break if input_file == "exit"


      if File.readable? (input_file)
        input_data = File.read(input_file)
        break
      else
          puts('Wrong filename or file not exist. Try again.')
          i += 1
          next
      end

  end

  if input_file != "exit" and File.readable? (input_file) then

      # main

    initial_position = {horizontal: 0, depth: 0}

    def parse_input(input_data)

      steps = []

      input_data = input_data.split("\n")

      input_data.each do |data|

        tmp = {forward: 0, down: 0, up: 0}
        tmp[:"#{(data.split(" "))[0]}"] = ("#{(data.split(" "))[1]}").to_f  # a bit heavy...? maybe use one morevariable
        steps << tmp

      end
      return steps

    end

    def calculate_position(initial_position, steps)

      position = initial_position  # better to be clear, or just use initial_position?

      steps.each do |step|

        position[:horizontal] += step[:forward]
        position[:depth] += step[:down]
        position[:depth] -= step[:up]

      end
      return position

    end

    steps = parse_input(input_data)

    final_position = calculate_position(initial_position, steps)



    # input_data.each do |value|
    #   case
    #   when value.include?('forward') then position[:horizontal] += (value.delete"a-z").to_f
    #   when value.include?('down') then position[:depth] += (value.delete"a-z").to_f
    #   when value.include?('up') then position[:depth] -= (value.delete"a-z").to_f
    #   end
    # end

    puts("Horizontal position : #{final_position[:horizontal]}, and depth : #{final_position[:depth]}.")
    puts("Multiply horizontal and depth : #{final_position[:horizontal] * final_position[:depth]} ")

  end

end
