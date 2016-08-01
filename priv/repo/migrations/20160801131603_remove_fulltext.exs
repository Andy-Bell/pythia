defmodule Pythia.Repo.Migrations.RemoveFulltext do
  use Ecto.Migration

  def change do
    alter table(:data) do
      remove :full_text
    end
  end
end
