defmodule Pythia.Data do
  use Pythia.Web, :model
  use Ecto.Schema

  schema "test" do
    field :title, :string
    field :description, :string
    field :url, :string
    field :full_text, :string

    timestamps
  end
end
