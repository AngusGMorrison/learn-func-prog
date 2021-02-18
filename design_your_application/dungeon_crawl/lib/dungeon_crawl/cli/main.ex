defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    Shell.prompt("Press Enter to continue")
    difficulty = DungeonCrawl.CLI.DifficultyChoice.start()
    rooms = DungeonCrawl.Room.difficulty_adjusted(difficulty)
    crawl(hero_choice(), rooms)
  end

  defp welcome_message do
    Shell.info("== Dungeon Crawl ==")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survive and find the exit.")
  end

  defp hero_choice do
    hero = DungeonCrawl.CLI.HeroChoice.start()
    %{hero | name: "You"}
  end

  defp difficulty_choice do
    DungeonCrawl.CLI.DifficultyChoice.start()
  end

  defp crawl(%{hit_points: 0}, _) do
    Shell.prompt("")
    Shell.cmd("clear")
    Shell.info("You Died")
    Shell.prompt("")
  end

  defp crawl(character, rooms) do
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press Enter to continue")
    Shell.cmd("clear")

    Shell.info(DungeonCrawl.Character.current_stats(character))

    rooms
    |> DungeonCrawl.WeightedChoice.select()
    |> DungeonCrawl.CLI.RoomActionsChoice.start()
    |> trigger_action(character)
    |> handle_action_result
  end

  defp trigger_action({room, action}, character) do
    Shell.cmd("clear")
    room.trigger.run(character, action)
  end

  defp handle_action_result({_, :exit}) do
    Shell.info("You found the exit. You won the game. Congratulations!")
  end

  defp handle_action_result({character, _}) do
    crawl(character, DungeonCrawl.Room.all())
  end
end
