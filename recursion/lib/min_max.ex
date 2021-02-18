defmodule MinMax do
  def max([]), do: nil
  def max([first | rest]), do: find_max_item(rest, first)

  defp find_max_item([], max_item), do: max_item
  defp find_max_item([first | rest], max_item) when first > max_item do
    find_max_item(rest, first)
  end
  defp find_max_item([first | rest], max_item) when first <= max_item do
    find_max_item(rest, max_item)
  end

  def min([]), do: nil
  def min([first | rest]), do: find_min_item(rest, first)

  defp find_min_item([], min_item), do: min_item
  defp find_min_item([first | rest], min_item) when first < min_item do
    find_min_item(rest, first)
  end
  defp find_min_item([first | rest], min_item) when first >= min_item do
    find_min_item(rest, min_item)
  end
end
