defmodule Pythia.Ranking do
  import Ecto.Query
  use Ecto.Schema

  @url_score 1.0
  @title_score 0.4
  @description_score 0.1
  @zero_value 0.0
  def score(data, keyword) do
    data_filter(data)
    |> Enum.map( fn(x) -> {x, assign_score(x, keyword)} end)
    |> Enum.sort_by(&elem(&1, 1), &>=/2)
    |> Enum.map(fn({x,_y}) -> x end)
  end

  def assign_score(data, keyword) do
      [data.url, data.title, data.description]
      |> Enum.map(&calculate_score(&1, keyword))
  end

  defp calculate_score(params, keyword) do
    unless params == nil do
      if String.contains?(String.downcase(params), keyword) do fn 
        %{url: _} ->  @url_score 
        %{title: _} -> @title_score 
        %{description: _} -> @description_score end
      else
        @zero_value
      end
    end
  end
  
  defp data_filter(data) do
    data
    |>Enum.map(&Enum.drop_while([&1], fn(x) -> x == nil end))
    |>List.flatten
  end
end

