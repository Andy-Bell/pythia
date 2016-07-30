defmodule Pythia.Query do
  import Ecto.Query
  alias Pythia.Data
  use Ecto.Schema

  def database_search(query) do
    Pythia.Repo.all(from d in Data, select: d.title)
    |>Enum.map(fn x -> if includes_query(x, query) do x end end)
    |>Enum.drop_while(fn x -> x == nil end)
  end

  defp includes_query(data, query) do
    String.contains?(data, query)
  end

end
