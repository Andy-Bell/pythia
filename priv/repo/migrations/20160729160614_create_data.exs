defmodule Pythia.Repo.Migrations.CreateData do
  use Ecto.Migration

  def change do
    create table(:data) do
      add :title, :string
      add :description, :string
      add :url, :string
      add :full_text, :string

      timestamps
    end

    create unique_index(:data, [:url])
  end
end
