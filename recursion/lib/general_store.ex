defmodule GeneralStore do
  def test_data do
    [
      %{title: "Longsword", price: 50, magic: false},
      %{title: "Healing Potion", price: 60, magic: true},
      %{title: "Rope", price: 10, magic: false},
      %{title: "Dragon's Spear", price: 100, magic: true}
    ]
  end

  def filter_items([], magic: _magic), do: []
  def filter_items([item = %{magic: is_magic} | rest], magic: magic) when is_magic == magic do
    [item | filter_items(rest, magic: magic)]
  end
  def filter_items([_ | rest], magic: magic) do
    filter_items(rest, magic: magic)
  end
end
