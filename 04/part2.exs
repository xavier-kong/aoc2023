defmodule Main do
  def traverse(curr_index, end_index, cards, possible) do
    if curr_index == end_index do
      cards
    else
      cards_to_add = Enum.at(possible, curr_index) * Enum.at(cards, curr_index);

      new_cards = Main.add_cards(curr_index + 1, cards_to_add, cards)

      traverse(curr_index + 1, end_index, new_cards, possible)
    end
  end

  def add_cards(curr_index, cards_to_add, cards) do
    if cards_to_add == 0 or curr_index == length(cards) do
      cards
    else
      val = Enum.at(cards, curr_index) + 1
      new_cards = List.replace_at(cards, curr_index, val)
      add_cards(curr_index + 1, cards_to_add - 1, new_cards)
    end
  end
end

possible = File.stream!("test.txt") 
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

cards = List.duplicate(1, length(possible))

res = Main.traverse(0, length(possible) - 1, cards, possible)

sum = Enum.reduce(res, fn x, acc -> x + acc end)

IO.inspect(sum)
