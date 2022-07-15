defmodule ChartWeb.RevenueView do
  use ChartWeb, :view

  def fetch_chart_data(revenues) do
    Enum.map(revenues, & &1.amount)
  end

  def fetch_chart_labels(revenues) do
    Enum.map(revenues, & &1.year)
  end
end
