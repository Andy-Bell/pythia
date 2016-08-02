defmodule Pythia.Ranking do
  import Ecto.Query
  use Ecto.Schema

  @url_score 1.0
  @title_score 0.4
  @description_score 0.1

  def score(data, keyword) do
    Enum.map(data, fn(x) -> {x, assign_score(x, keyword)} end)
    |> Enum.sort_by(&elem(&1, 1), &>=/2)
    |> Enum.map(fn({x,_y}) -> x end)
  end

  def assign_score(data, keyword) do
    unless data == nil do
      total_ranking = 0.0
      |> if_url(data, keyword)
    |> IO.inspect
      |> if_title(data, keyword)
    |> IO.inspect
      |> if_description(data, keyword)
    end
  end

  defp if_url(total_ranking, data, keyword) do
    unless data.url == nil do
      if String.contains?(String.downcase(data.url), keyword) do
        total_ranking + @url_score
       else
        total_ranking
      end
    else
      total_ranking
    end
  end

  defp if_title(total_ranking, data, keyword) do
    unless data.title == nil do
      if String.contains?(String.downcase(data.title), keyword) do
        total_ranking + @title_score
      else
        total_ranking
      end
    else
      total_ranking
    end
  end

  defp if_description(total_ranking, data, keyword) do
    unless data.description == nil do
      if String.contains?(String.downcase(data.description), keyword) do
        total_ranking + @description_score
      else
        total_ranking
      end
    else
      total_ranking
    end
  end

end
