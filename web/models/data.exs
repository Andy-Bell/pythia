defmodule Pythia.Data do
  use Pythia.Web, :model

  schema "data" do
    field :title, :string
    field :description, :string
    field :url, :string
    field :full_text, :string

    timestamps
  end
end
