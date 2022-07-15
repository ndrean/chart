defmodule Chart.Progress.Revenue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "revenues" do
    field :amount, :float
    field :year, :integer

    timestamps()
  end

  @doc false
  def changeset(revenue, attrs) do
    revenue
    |> cast(attrs, [:year, :amount])
    |> validate_required([:year, :amount])
  end
end
