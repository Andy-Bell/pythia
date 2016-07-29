defmodule Pythia.Query do
  import Ecto.Query

  def database_search(query) do
    Repo.all(from d in Data, select: d.title)
    |>Enum.map(fn x -> if includes_query(x,query) do x end end)
  end

  defp includes_query(data,query) do
    String.contains?(data, query)
  end

end
