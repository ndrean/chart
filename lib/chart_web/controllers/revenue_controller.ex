defmodule ChartWeb.RevenueController do
  use ChartWeb, :controller

  alias Chart.Progress
  alias Chart.Progress.Revenue

  def index(conn, _params) do
    revenues = Progress.list_revenues()
    render(conn, "index.html", revenues: revenues)
  end

  def new(conn, _params) do
    changeset = Progress.change_revenue(%Revenue{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"revenue" => revenue_params}) do
    case Progress.create_revenue(revenue_params) do
      {:ok, revenue} ->
        conn
        |> put_flash(:info, "Revenue created successfully.")
        |> redirect(to: Routes.revenue_path(conn, :show, revenue))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    revenue = Progress.get_revenue!(id)
    render(conn, "show.html", revenue: revenue)
  end

  def edit(conn, %{"id" => id}) do
    revenue = Progress.get_revenue!(id)
    changeset = Progress.change_revenue(revenue)
    render(conn, "edit.html", revenue: revenue, changeset: changeset)
  end

  def update(conn, %{"id" => id, "revenue" => revenue_params}) do
    revenue = Progress.get_revenue!(id)

    case Progress.update_revenue(revenue, revenue_params) do
      {:ok, revenue} ->
        conn
        |> put_flash(:info, "Revenue updated successfully.")
        |> redirect(to: Routes.revenue_path(conn, :show, revenue))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", revenue: revenue, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    revenue = Progress.get_revenue!(id)
    {:ok, _revenue} = Progress.delete_revenue(revenue)

    conn
    |> put_flash(:info, "Revenue deleted successfully.")
    |> redirect(to: Routes.revenue_path(conn, :index))
  end
end
