defmodule Pythia.Ranking do
  import Ecto.Query
  use Ecto.Schema

  @url_score 1.0
  @title_score 0.4
  @description_score 0.1

  def score(data, keyword) do
    Enum.map(data, &assign_score(&1, keyword))
  end

  def assign_score(data, keyword) do
    total_ranking = 0.0
    |> if_url(data, keyword)
    |> if_title(data, keyword)
    |> if_description(data, keyword)
    IO.inspect(total_ranking)
  end

  defp if_url(total_ranking, data, keyword) do
    if String.contains?(String.downcase(data.url), keyword) do
      total_ranking = total_ranking + @url_score
     else
       total_ranking
     end
  end

  defp if_title(total_ranking, data, keyword) do
    if String.contains?(String.downcase(data.title), keyword) do
      total_ranking = total_ranking + @title_score
     else
       total_ranking
     end
  end

  defp if_description(total_ranking, data, keyword) do
    if String.contains?(String.downcase(data.description), keyword) do
      total_ranking = total_ranking + @description_score
    else
      total_ranking
    end
  end


end
