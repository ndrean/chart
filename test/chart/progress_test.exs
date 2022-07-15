defmodule Chart.ProgressTest do
  use Chart.DataCase

  alias Chart.Progress

  describe "revenues" do
    alias Chart.Progress.Revenue

    import Chart.ProgressFixtures

    @invalid_attrs %{amount: nil, year: nil}

    test "list_revenues/0 returns all revenues" do
      revenue = revenue_fixture()
      assert Progress.list_revenues() == [revenue]
    end

    test "get_revenue!/1 returns the revenue with given id" do
      revenue = revenue_fixture()
      assert Progress.get_revenue!(revenue.id) == revenue
    end

    test "create_revenue/1 with valid data creates a revenue" do
      valid_attrs = %{amount: 120.5, year: 42}

      assert {:ok, %Revenue{} = revenue} = Progress.create_revenue(valid_attrs)
      assert revenue.amount == 120.5
      assert revenue.year == 42
    end

    test "create_revenue/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Progress.create_revenue(@invalid_attrs)
    end

    test "update_revenue/2 with valid data updates the revenue" do
      revenue = revenue_fixture()
      update_attrs = %{amount: 456.7, year: 43}

      assert {:ok, %Revenue{} = revenue} = Progress.update_revenue(revenue, update_attrs)
      assert revenue.amount == 456.7
      assert revenue.year == 43
    end

    test "update_revenue/2 with invalid data returns error changeset" do
      revenue = revenue_fixture()
      assert {:error, %Ecto.Changeset{}} = Progress.update_revenue(revenue, @invalid_attrs)
      assert revenue == Progress.get_revenue!(revenue.id)
    end

    test "delete_revenue/1 deletes the revenue" do
      revenue = revenue_fixture()
      assert {:ok, %Revenue{}} = Progress.delete_revenue(revenue)
      assert_raise Ecto.NoResultsError, fn -> Progress.get_revenue!(revenue.id) end
    end

    test "change_revenue/1 returns a revenue changeset" do
      revenue = revenue_fixture()
      assert %Ecto.Changeset{} = Progress.change_revenue(revenue)
    end
  end
end
