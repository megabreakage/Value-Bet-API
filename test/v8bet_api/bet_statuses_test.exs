defmodule V8betApi.BetStatusesTest do
  use V8betApi.DataCase

  alias V8betApi.BetStatuses

  describe "bet_statuses" do
    alias V8betApi.BetStatuses.BetStatus

    import V8betApi.BetStatusesFixtures

    @invalid_attrs %{deleted_at: nil, name: nil}

    test "list_bet_statuses/0 returns all bet_statuses" do
      bet_status = bet_status_fixture()
      assert BetStatuses.list_bet_statuses() == [bet_status]
    end

    test "get_bet_status!/1 returns the bet_status with given id" do
      bet_status = bet_status_fixture()
      assert BetStatuses.get_bet_status!(bet_status.id) == bet_status
    end

    test "create_bet_status/1 with valid data creates a bet_status" do
      valid_attrs = %{deleted_at: ~U[2024-04-18 01:23:00Z], name: "some name"}

      assert {:ok, %BetStatus{} = bet_status} = BetStatuses.create_bet_status(valid_attrs)
      assert bet_status.deleted_at == ~U[2024-04-18 01:23:00Z]
      assert bet_status.name == "some name"
    end

    test "create_bet_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BetStatuses.create_bet_status(@invalid_attrs)
    end

    test "update_bet_status/2 with valid data updates the bet_status" do
      bet_status = bet_status_fixture()
      update_attrs = %{deleted_at: ~U[2024-04-19 01:23:00Z], name: "some updated name"}

      assert {:ok, %BetStatus{} = bet_status} =
               BetStatuses.update_bet_status(bet_status, update_attrs)

      assert bet_status.deleted_at == ~U[2024-04-19 01:23:00Z]
      assert bet_status.name == "some updated name"
    end

    test "update_bet_status/2 with invalid data returns error changeset" do
      bet_status = bet_status_fixture()

      assert {:error, %Ecto.Changeset{}} =
               BetStatuses.update_bet_status(bet_status, @invalid_attrs)

      assert bet_status == BetStatuses.get_bet_status!(bet_status.id)
    end

    test "delete_bet_status/1 deletes the bet_status" do
      bet_status = bet_status_fixture()
      assert {:ok, %BetStatus{}} = BetStatuses.delete_bet_status(bet_status)
      assert_raise Ecto.NoResultsError, fn -> BetStatuses.get_bet_status!(bet_status.id) end
    end

    test "change_bet_status/1 returns a bet_status changeset" do
      bet_status = bet_status_fixture()
      assert %Ecto.Changeset{} = BetStatuses.change_bet_status(bet_status)
    end
  end
end
