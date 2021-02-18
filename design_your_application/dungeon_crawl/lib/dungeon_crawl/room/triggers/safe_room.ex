defmodule DungeonCrawl.Room.Triggers.SafeRoom do
  @behaviour DungeonCrawl.Room.Trigger

  alias DungeonCrawl.Character
  alias DungeonCrawl.Room.Action
  alias Mix.Shell.IO, as: Shell

  def run(character, %Action{id: :forward}) do
    Shell.info("You press on without rest.")
    {character, :forward}
  end

  # @healing_factor is the fraction of a hero's max hit points that can be regained from resting.
  @healing_factor 4

  def run(character, %Action{id: :rest}) when character.hit_points == character.max_hit_points do
    Shell.info("You're at full health, but you take a moment to catch your breath anyway.")
    {character, :forward}
  end

  def run(character, %Action{id: :rest}) do
    max_healing = div(character.max_hit_points, @healing_factor)
    healed_character = Character.heal(character, max_healing)
    amount_healed = healed_character.hit_points - character.hit_points

    Shell.info("You take a short rest, healing #{amount_healed} HP.")
    Shell.info(Character.current_stats(healed_character))

    {healed_character, :forward}
  end
end
