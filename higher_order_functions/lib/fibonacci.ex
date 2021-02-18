defmodule Fibonacci do
  def gen_recursively(target) when target > 0 do
    recurse(target, 1, 0)
  end

  defp recurse(target, prev, penult) when prev + penult > target, do: nil
  defp recurse(target, prev, penult) when target > 0 do
    current = prev + penult
    IO.puts current
    recurse(target, current, prev)
  end

  def gen_stream(target) when target > 0 do
    Stream.unfold({0, 1}, fn {n1, n2} -> {n1, {n2, n1 + n2}} end)
    |> Enum.take(target)
  end
end
