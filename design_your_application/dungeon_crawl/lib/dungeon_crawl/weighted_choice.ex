defmodule DungeonCrawl.WeightedChoice do
  def select(list) do
    value =
      list
      |> Enum.sort_by(& &1.weight)
      |> sum_weights()
      |> :rand.uniform()

    select_element(list, value)
  end

  defp sum_weights(list), do: Enum.reduce(list, 0, fn %{weight: w}, acc -> w + acc end)

  defp select_element([elem], _), do: elem
  defp select_element([elem = %{weight: w} | _], target_weight) when w >= target_weight, do: elem

  defp select_element([%{weight: w} | tail], target_weight) do
    select_element(tail, target_weight - w)
  end
end
