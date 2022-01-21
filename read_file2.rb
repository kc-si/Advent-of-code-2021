def read_file
  file = ARGV[0]

  if file
    input_file = file
  else
    puts(' Type filename with extension if exist (or type EXIT if you want to quit) end press ENTER :')
    input_file = gets
    input_file = input_file.chop
  end

  return if input_file == "exit"

  if File.readable? (input_file)
    input_data = File.read(input_file)
  else
      puts('Wrong filename or file not exist.')
  end
end
