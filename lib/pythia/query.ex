defmodule Pythia.Query do
  import Ecto.Query
  alias Pythia.Data
  alias Pythia.Ranking
  use Ecto.Schema

  def list_search_results(query) do
    String.split(query, " ")
    |> Enum.map(fn x -> database_search(x) end)
    |> List.flatten
    |> Enum.uniq
    |> Ranking.ranked_list(query)
  end

  defp database_search(keyword) do
    Pythia.Repo.all(from d in Data, select: d)
    |> Enum.map(fn x -> if (search_parameters(x, keyword)) do x end end)
    |> Enum.drop_while(fn x -> x == nil end)
  end

  defp includes_query(data, query) do
    if data != nil, do: String.contains?(String.downcase(data), query)
  end

  defp search_parameters(data, keyword) do
    [data.title, data.description, data.url]
    |> Enum.map(&includes_query(&1, keyword))
    |> Enum.any?(&(&1 == true))
  end
end
