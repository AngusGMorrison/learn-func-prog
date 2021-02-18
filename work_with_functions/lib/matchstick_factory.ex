defmodule MatchstickFactory do
  @size_big = 50
  @size_medium = 20
  @size_small = 5

  def boxes(n_matchsticks) do
    big = div(n_matchsticks, @size_big)
    leftover = rem(n_matchsticks, @size_big)

    medium = div(leftover, @size_medium)
    leftover = rem(leftover, @size_medium)

    small = div(leftover, @size_small)
    leftover = rem(leftover, @size_small)

    %{
      big: big,
      medium: medium,
      small: small,
      remaining_matchsticks: leftover
    }
  end
end
