use Integer

vals = File.stream!("test.txt") 
  |> Stream.map(&String.trim/1)
  |> Stream.map(fn (line) ->
      [_no, yes] = String.split(line, ":")
      [nums, draw] = String.split(yes, " | ")
      winners = Enum.filter(String.split(nums, " "), fn x -> x != "" end)

      lucky = Enum.filter(
        Enum.filter(String.split(draw, " "), fn x -> x != "" end), 
        fn num -> Enum.member?(winners, num) 
      end)

      length(lucky)
    end
  )
  |> Enum.to_list()

no_zeros = Enum.filter(vals, fn x -> x != 0 end)

ans = Enum.reduce(no_zeros, 0, fn x, acc -> acc + Integer.pow(2, x - 1)  end)
IO.inspect(ans)
IO.inspect(vals)

