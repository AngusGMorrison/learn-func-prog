defmodule SlinkSkipNavigator do
  @max_depth 2

  def navigate(path) do
    expanded_path = Path.expand(path)
    go_through([expanded_path], 0)
  end

  defp go_through([], _current_depth), do: nil
  defp go_through(_paths, current_depth) when current_depth > @max_depth, do: nil
  defp go_through([path | rest], current_depth) do
    print_and_navigate(path, dir?(path), current_depth)
    go_through(rest, current_depth)
  end

  defp dir?(dir) do
    {:ok, %{type: type}} = File.lstat(dir)
    type == :directory
  end

  defp print_and_navigate(_path, false, _current_depth), do: nil
  defp print_and_navigate(path, true, current_depth) do
    IO.puts path
    children = File.ls!(path)
    go_through(expand_paths(children, path), current_depth + 1)
  end

  defp expand_paths([], _relative_to), do: []
  defp expand_paths([path | rest], relative_to) do
    expanded_path = Path.expand(path, relative_to)
    [expanded_path | expand_paths(rest, relative_to)]
  end
end
