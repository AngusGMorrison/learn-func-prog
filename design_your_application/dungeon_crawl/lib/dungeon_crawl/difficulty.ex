defmodule DungeonCrawl.Difficulty do
  @max_difficulty 3

  def to_factor(difficulty) when difficulty in 1..@max_difficulty do
    mapping = %{
      1 => 2.0,
      2 => 1.0,
      3 => 0.5
    }

    mapping[difficulty]
  end

  def all, do: 1..@max_difficulty
end
