defmodule CharacterSheet do
  @str_modifier 2
  @dex_modifier 3
  @int_modifier 3

  def total_points(%{strength: str, dexterity: dex, intelligence: int}) do
    (str * @str_modifier) + (dex * @dex_modifier) + (int * @int_modifier)
  end
end
