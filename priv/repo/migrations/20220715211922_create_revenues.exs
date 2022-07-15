defmodule Chart.Repo.Migrations.CreateRevenues do
  use Ecto.Migration

  def change do
    create table(:revenues) do
      add :year, :integer
      add :amount, :float

      timestamps()
    end
  end
end
