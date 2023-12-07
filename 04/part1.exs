File.stream!("test.txt") 
  |> Stream.map(&String.trim/1)
  |> Stream.map(fn (line) ->
  [_no, yes] = String.split(line, ":")
  [nums, draw] = String.split(yes, " | ")
  winners = String.split(nums, " ")

  drew = String.split(draw, " ")

  for num <- drew do
    IO.puts '#{Enum.member?(winners, num)}'
  end
  
  IO.puts "#{winners}" 
  end
  )
  |> Stream.run
