defmodule Pythia.Query do
  import Ecto.Query
  alias Pythia.Data
  use Ecto.Schema

  defp database_search(keyword) do
    Pythia.Repo.all(from d in Data, select: d.url)
    |> Enum.map(fn x -> if includes_query(x, keyword) do x end end)
    |> Enum.drop_while(fn x -> x == nil end)
  end

  defp includes_query(data, query) do
    String.contains?(data, query)
  end

  def split_string(query) do
  String.split(query, " ")
  |> Enum.map(fn x -> database_search(x) end)
  |> List.flatten
  |> Enum.uniq
  end



end
