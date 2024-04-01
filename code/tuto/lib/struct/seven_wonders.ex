defmodule Tuto.Struct.SevenWonders do
  defstruct name: "", country: ""

  alias Tuto.Struct.SevenWonders

  @type t :: %SevenWonders{
          name: String.t(),
          country: String.t()
        }

  @spec all :: [t()]
  def all() do
    [
      %SevenWonders{name: "Great Pyramid of Giza", country: "Egypt"},
      %SevenWonders{name: "Hanging Gardens of Babylon", country: "Iraq"},
      %SevenWonders{name: "Statue of Zeus at Olympia", country: "Greece"},
      %SevenWonders{name: "Temple of Artemis at Ephesus", country: "Turkey"},
      %SevenWonders{name: "Mausoleum at Halicarnassus", country: "Turkey"},
      %SevenWonders{name: "Colossus of Rhodes", country: "Greece"},
      %SevenWonders{name: "Lighthouse of Alexandria", country: "Egypt"}
    ]
  end

  @spec print_names([t()]) :: :ok
  def print_names(wonders) do
    Enum.each(wonders, fn %{name: name} -> IO.puts(name) end)
  end

  @spec filter_by_country([t()], String.t()) :: [t()]
  def filter_by_country(wonders, country) do
    Enum.filter(wonders, fn %{country: country_name} -> country_name == country end)
  end

  def in_countries_starting_with_i(wonders) do
    Enum.filter(wonders, fn %{country: country} -> String.starts_with?(country, "I") end)
  end

  def sort_by_country_length(wonders) do
    wonders
    |> Enum.sort(fn x, y -> String.length(x.country) < String.length(y.country) end)
  end

  def name_country_list(wonders) do
    Enum.reduce(wonders, [], fn wonder, acc -> [[wonder.name, wonder.country] | acc] end)
  end

  def country_name_map(wonders) do
    Enum.reduce(wonders, %{}, fn wonder, acc -> Map.put(acc, wonder.name, wonder.country) end)
  end

  def country_name_keyword_list(wonders) do
    Enum.reduce(wonders, [], fn wonder, acc ->
      [{String.to_atom(wonder.name), wonder.country} | acc]
    end)
  end
end
