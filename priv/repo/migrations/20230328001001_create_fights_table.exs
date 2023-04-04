defmodule Pokefight.Repo.Migrations.CreateFightsTable do
  use Ecto.Migration

  def change do
    create table(:fights) do
      add :pokemon1, :string
      add :pokemon2, :string
      add :winner, :string

      timestamps()
    end
  end
end
