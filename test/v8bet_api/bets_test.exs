defmodule V8betApi.BetsTest do
  use V8betApi.DataCase

  alias V8betApi.Bets

  describe "bets" do
    alias V8betApi.Bets.Bet

    import V8betApi.BetsFixtures

    @invalid_attrs %{amount: nil, expires_at: nil, start_time: nil}

    test "list_bets/0 returns all bets" do
      bet = bet_fixture()
      assert Bets.list_bets() == [bet]
    end

    test "get_bet!/1 returns the bet with given id" do
      bet = bet_fixture()
      assert Bets.get_bet!(bet.id) == bet
    end

    test "create_bet/1 with valid data creates a bet" do
      valid_attrs = %{amount: 120.5, expires_at: ~U[2024-04-18 01:42:00Z], start_time: ~U[2024-04-18 01:42:00Z]}

      assert {:ok, %Bet{} = bet} = Bets.create_bet(valid_attrs)
      assert bet.amount == 120.5
      assert bet.expires_at == ~U[2024-04-18 01:42:00Z]
      assert bet.start_time == ~U[2024-04-18 01:42:00Z]
    end

    test "create_bet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bets.create_bet(@invalid_attrs)
    end

    test "update_bet/2 with valid data updates the bet" do
      bet = bet_fixture()
      update_attrs = %{amount: 456.7, expires_at: ~U[2024-04-19 01:42:00Z], start_time: ~U[2024-04-19 01:42:00Z]}

      assert {:ok, %Bet{} = bet} = Bets.update_bet(bet, update_attrs)
      assert bet.amount == 456.7
      assert bet.expires_at == ~U[2024-04-19 01:42:00Z]
      assert bet.start_time == ~U[2024-04-19 01:42:00Z]
    end

    test "update_bet/2 with invalid data returns error changeset" do
      bet = bet_fixture()
      assert {:error, %Ecto.Changeset{}} = Bets.update_bet(bet, @invalid_attrs)
      assert bet == Bets.get_bet!(bet.id)
    end

    test "delete_bet/1 deletes the bet" do
      bet = bet_fixture()
      assert {:ok, %Bet{}} = Bets.delete_bet(bet)
      assert_raise Ecto.NoResultsError, fn -> Bets.get_bet!(bet.id) end
    end

    test "change_bet/1 returns a bet changeset" do
      bet = bet_fixture()
      assert %Ecto.Changeset{} = Bets.change_bet(bet)
    end
  end
end
