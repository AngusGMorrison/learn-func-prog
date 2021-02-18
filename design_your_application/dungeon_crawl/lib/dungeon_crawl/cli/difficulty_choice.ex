defmodule DungeonCrawl.CLI.DifficultyChoice do
  alias Mix.Shell.IO, as: Shell

  import DungeonCrawl.CLI.BaseCommands

  def start do
    Shell.cmd("clear")
    Shell.info("Select your difficulty level:")

    choices = DungeonCrawl.Difficulty.all()
    find_difficulty_by_index = &Enum.at(choices, &1)

    choices
    |> display_options
    |> generate_question()
    |> Shell.prompt()
    |> parse_answer()
    |> find_difficulty_by_index.()

    # Complete this flow by implementing confirm_choice (in hero_choice) for difficulty_choice
  end
end
