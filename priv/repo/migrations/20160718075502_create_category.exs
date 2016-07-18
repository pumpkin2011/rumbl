defmodule Rumbl.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:categoreis) do
      add :name, :string

      timestamps()
    end

  end
end
