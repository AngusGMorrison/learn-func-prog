defmodule BreadthNavigator do
  @max_breadth 3

  def navigate(path) do
    expanded_path = Path.expand(path)
    go_through([expanded_path], 0)
  end

  defp go_through([], _current_breadth), do: nil
  defp go_through(_paths, current_breadth) when current_breadth >= @max_breadth, do: nil
  defp go_through([first_path | rest], current_breadth) when current_breadth < @max_breadth do
    list_children(first_path, current_breadth, File.dir?(first_path))
    go_through(rest, current_breadth + 1)
  end

  defp list_children(_path, _current_breadth, false), do: nil
  defp list_children(path, current_breadth, true) do
    IO.puts(path)
    expanded_children = expand_paths(File.ls!(path), path, [])
    go_through(expanded_children, current_breadth)
  end

  defp expand_paths([], _relative_to, expanded_paths), do: expanded_paths
  defp expand_paths([first | rest], relative_to, expanded_paths) do
    expanded = Path.expand(first, relative_to)
    expand_paths(rest, relative_to, [expanded | expanded_paths])
  end
end
