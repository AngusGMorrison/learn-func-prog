defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Difficulty
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers

  import DungeonCrawl.Room.Action

  defstruct description: "", actions: [], trigger: nil, weight: 0

  def difficulty_adjusted(difficulty) do
    weight_factor = Difficulty.to_factor(difficulty)
    adjust_hazards(weight_factor) ++ safe()
  end

  defp adjust_hazards(difficulty) do
    Enum.map(hazard(), &%{&1 | weight: &1.weight * weight_factor})
  end

  def all, do: [exit(), enemy(), safe_room(), trap(), treasure(), ambush()]

  def hazard, do: [enemy(), trap(), ambush()]

  def safe, do: [exit(), safe_room(), treasure()]

  defp exit,
    do: %Room{
      description: "You can see the light of day. You found the exit!",
      actions: [forward()],
      trigger: Triggers.Exit,
      weight: 5
    }

  defp enemy,
    do: %Room{
      description: "You can see an enemy blocking your path.",
      actions: [forward()],
      trigger: Triggers.Enemy,
      weight: 50
    }

  defp safe_room,
    do: %Room{
      description: "The room ahead of you appears to be safe... for now.",
      actions: [rest(), forward()],
      trigger: Triggers.SafeRoom,
      weight: 15
    }

  defp trap,
    do: %Room{
      description: "The room ahead of you appears still and empty.",
      actions: [forward(), search()],
      trigger: Triggers.Trap,
      weight: 10
    }

  defp treasure,
    do: %Room{
      description: "The room ahead of you appears still and empty.",
      actions: [forward(), search()],
      trigger: Triggers.Treasure,
      weight: 10
    }

  defp ambush,
    do: %Room{
      description: "The room ahead of you appears to be safe... for now.",
      actions: [rest(), forward()],
      trigger: Triggers.Ambush,
      weight: 10
    }
end
