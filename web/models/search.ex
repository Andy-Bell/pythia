defmodule Pythia.Search do
  use Pythia.Web, :model

  schema "search" do
    field :query, :string
    field :results, :map
    timestamps
  end

end
