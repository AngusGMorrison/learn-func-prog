defmodule Factorial do
  def of(0), do: 1
  def of(n) when n > 0 do
    1..10_000_000
      |> Enum.take(n)
      |> Enum.reduce(&*/2)
  end
end
