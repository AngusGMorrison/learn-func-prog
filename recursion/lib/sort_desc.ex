defmodule SortDesc do
  def desc([]), do: []
  def desc([a]), do: [a]
  def desc(list) do
    half_length = div(Enum.count(list), 2)
    {list_a, list_b} = Enum.split(list, half_length)
    merge(
      desc(list_a),
      desc(list_b)
    )
  end

  defp merge(list_a, []), do: list_a
  defp merge([], list_b), do: list_b
  defp merge([head_a | tail_a], list_b = [head_b | _]) when head_a >= head_b do
    [head_a | merge(tail_a, list_b)]
  end
  defp merge(list_a = [head_a | _], [head_b | tail_b]) when head_a < head_b do
    [head_b | merge(list_a, tail_b)]
  end
end