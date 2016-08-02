defmodule Pythia.Ranking do
  use Ecto.Schema

  @url_score 1.0
  @title_score 0.4
  @description_score 0.1
  @zero_value 0.0
  def ranked_list(data, keyword) do
    data_filter(data)
    |> Enum.map( fn(x) -> {x, assign_score(x, keyword)} end)
    |> Enum.sort_by(&elem(&1, 1), &>=/2)
    |> Enum.map(fn({x,_y}) -> x end)
  end

  defp assign_score(data, keyword) do
      [{:url, data.url}, {:title, data.title}, {:description, data.description}]
      |> Enum.map(&calculate_score(&1, keyword))
      |> Enum.sum
  end

  defp calculate_score(params, keyword) do
    cond do
      params == nil -> @zero_value
      {:title, nil} == params -> @zero_value
      {:description, nil} == params -> @zero_value
      string_match(params,keyword) -> check_params(params)
      true -> @zero_value
    end
  end
  
  defp check_params({:url, _}), do: @url_score
  defp check_params({:title, _}), do: @title_score
  defp check_params({:description, _}), do: @description_score
  
  defp data_filter(data) do
    data
    |>Enum.map(&drop_when_nil([&1]))
    |>List.flatten 
  end

  defp convert_lowercase(string), do: String.downcase(string)

  defp extract_from_tuple(tuple) do
    elem(tuple,1)
  end

  defp string_match(params, keyword) do
    params
    |>extract_from_tuple
    |>convert_lowercase
    |>String.contains?(keyword)
  end

  defp drop_when_nil(list) do
    Enum.reject(list, &is_nil(&1))
  end
end

