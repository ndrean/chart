defmodule Chart.ProgressFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Chart.Progress` context.
  """

  @doc """
  Generate a revenue.
  """
  def revenue_fixture(attrs \\ %{}) do
    {:ok, revenue} =
      attrs
      |> Enum.into(%{
        amount: 120.5,
        year: 42
      })
      |> Chart.Progress.create_revenue()

    revenue
  end
end
