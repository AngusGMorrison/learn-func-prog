defmodule DungeonCrawl.Room.Triggers.Ambush do
  @behaviour DungeonCrawl.Room.Trigger

  alias DungeonCrawl.Room.Action
  alias Mix.Shell.IO, as: Shell

  def run(character, %Action{id: :forward}) do
    Shell.info("You press on without rest.")
    {character, :forward}
  end

  def run(character, %Action{id: :rest}) do
    enemy = Enum.random(DungeonCrawl.Enemies.all())
    Shell.info("You settle down to rest...")
    Shell.info("Suddenly, you're ambushed!")
    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} surprises you and attacks first.")
    {_enemy, updated_char} = DungeonCrawl.Battle.fight(enemy, character)

    { updated_char, :forward }
  end
end
