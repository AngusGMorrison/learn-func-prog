defmodule TR do
  def up_to(a, total \\ 0)
  def up_to(0, total), do: total
  def up_to(n, total) when n > 0, do: up_to(n - 1, total + n)

  def sum(a, total \\ 0)
  def sum([], total), do: total
  def sum([n], total), do: total + n
  def sum([head | tail], total), do: sum(tail, total + head)

  def sort_asc([]), do: []
  def sort_asc([a]), do: [a]
  def sort_asc(list) do
    mergesort(list)
  end

  defp mergesort([]), do: []
  defp mergesort([a]), do: [a]
  defp mergesort(list) do
    half_size = div(Enum.count(list), 2)
    {list_a, list_b} = Enum.split(list, half_size)

    merge(
      mergesort(list_a),
      mergesort(list_b),
      []
    )
  end

  defp merge(list_a, [], sorted_list), do: list_a ++ sorted_list
  defp merge([], list_b, sorted_list), do: list_b ++ sorted_list
  defp merge([head_a | tail_a], list_b = [head_b | _], sorted_list) when head_a <= head_b do
    merge(tail_a, list_b, [head_a | sorted_list])
  end
  defp merge(list_a = [head_a | _], [head_b | tail_b], sorted_list) when head_a > head_b do
    merge(list_a, tail_b, [head_b | sorted_list])
  end
end
