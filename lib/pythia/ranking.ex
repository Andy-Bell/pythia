defmodule Pythia.Ranking do
  import Ecto.Query
  use Ecto.Schema

  @url_score 1.0
  @title_score 0.4
  @description_score 0.1

  def score(data, keyword) do
    data_filter(data)
    |> Enum.map( fn(x) -> {x, assign_score(x, keyword)} end)
    |> Enum.sort_by(&elem(&1, 1), &>=/2)
    |> Enum.map(fn({x,_y}) -> x end)
  end

  def assign_score(data, keyword) do
      total_ranking = 0.0
      |> calculate_score(data.url, keyword)
      |> calculate_score(data.title, keyword)
      |> calculate_score(data.description, keyword)
  end

  defp calculate_score(total_ranking, params, keyword) do
    unless params == nil do
      if String.contains?(String.downcase(params), keyword) do fn 
        %{url: _} -> total_ranking + @url_score 
        %{title: _} -> total_ranking + @title_score 
        %{description: _} -> total_ranking + @description_score end
      end
    end
  end
  
  defp data_filter(data) do
    data
    |>Enum.map(&Enum.drop_while([&1], fn(x) -> x == nil end))
    |>List.flatten
  end
end

