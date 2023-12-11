def traverse(curr_index, end_index, cards, possible) do
  if curr_index == end_index
    return cards
  else
    return traverse(curr_index + 1, end_index, cards, possible)
  end
end


