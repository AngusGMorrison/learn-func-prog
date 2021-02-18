defmodule DungeonCrawl.Room.Triggers.Treasure do
  @behaviour DungeonCrawl.Room.Trigger

  alias DungeonCrawl.Character
  alias DungeonCrawl.Room.Action
  alias Mix.Shell.IO, as: Shell

  def run(character, %Action{id: :forward}) do
    Shell.info("You ignore the room and keep moving.")
    {character, :forward}
  end

  def run(character, %Action{id: :search}) do
    Shell.info("You search the room and find a healing potion!")

    {take_potion(character), :forward}
  end

  @healing_potion_hp 4

  defp take_potion(character = %{hit_points: hp, max_hit_points: mhp}) when hp == mhp do
    Shell.info("You're feeling great, but you chug it anyway. Can't be too careful.")
    character
  end

  defp take_potion(character) do
    healed_character = Character.heal(character, @healing_potion_hp)
    healing = healed_character.hit_points - character.hit_points
    Shell.info("You quaff the potion, healing #{healing} points.")

    healed_character
  end
end
