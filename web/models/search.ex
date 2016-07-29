defmodule Pythia.Search do
  use Pythia.Web, :model

  schema "search" do
    field :query, :string
    field :results, :map
    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |>cast(params, ~w(search), [])
  end
end
