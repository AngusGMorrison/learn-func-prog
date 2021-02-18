defmodule DungeonCrawl.Room.Triggers.Trap do
  @behaviour DungeonCrawl.Room.Trigger

  alias DungeonCrawl.Character
  alias DungeonCrawl.Room.Action
  alias Mix.Shell.IO, as: Shell

  @trap_damage 1..4

  def run(character, %Action{id: :forward}) do
    damage = Enum.random(@trap_damage)
    hurt_character = Character.take_damage(character, damage)
    Shell.info("You fall into a trap, taking #{damage} damage.")
    Shell.info(Character.current_stats(character))

    {hurt_character, :forward}
  end

  def run(character, %Action{id: :search}) do
    Shell.info("You search the room and find a trap!")
    Shell.info("You skirt around it carefully.")
    {character, :forward}
  end
end
