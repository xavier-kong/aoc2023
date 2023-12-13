defmodule Main do
  def traverse(curr_index, end_index, cards, possible) do
    if curr_index == end_index do
      cards
    else
      traverse(curr_index + 1, end_index, cards, possible)
    end
  end
end

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

IO.inspect(vals)
