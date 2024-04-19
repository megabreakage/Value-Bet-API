defmodule V8betApi.MatchesTest do
  use V8betApi.DataCase

  alias V8betApi.Matches

  describe "matches" do
    alias V8betApi.Matches.Match

    import V8betApi.MatchesFixtures

    @invalid_attrs %{deleted_at: nil, scheduled_at: nil}

    test "list_matches/0 returns all matches" do
      match = match_fixture()
      assert Matches.list_matches() == [match]
    end

    test "get_match!/1 returns the match with given id" do
      match = match_fixture()
      assert Matches.get_match!(match.id) == match
    end

    test "create_match/1 with valid data creates a match" do
      valid_attrs = %{deleted_at: ~U[2024-04-17 23:41:00Z], scheduled_at: ~U[2024-04-17 23:41:00Z]}

      assert {:ok, %Match{} = match} = Matches.create_match(valid_attrs)
      assert match.deleted_at == ~U[2024-04-17 23:41:00Z]
      assert match.scheduled_at == ~U[2024-04-17 23:41:00Z]
    end

    test "create_match/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Matches.create_match(@invalid_attrs)
    end

    test "update_match/2 with valid data updates the match" do
      match = match_fixture()
      update_attrs = %{deleted_at: ~U[2024-04-18 23:41:00Z], scheduled_at: ~U[2024-04-18 23:41:00Z]}

      assert {:ok, %Match{} = match} = Matches.update_match(match, update_attrs)
      assert match.deleted_at == ~U[2024-04-18 23:41:00Z]
      assert match.scheduled_at == ~U[2024-04-18 23:41:00Z]
    end

    test "update_match/2 with invalid data returns error changeset" do
      match = match_fixture()
      assert {:error, %Ecto.Changeset{}} = Matches.update_match(match, @invalid_attrs)
      assert match == Matches.get_match!(match.id)
    end

    test "delete_match/1 deletes the match" do
      match = match_fixture()
      assert {:ok, %Match{}} = Matches.delete_match(match)
      assert_raise Ecto.NoResultsError, fn -> Matches.get_match!(match.id) end
    end

    test "change_match/1 returns a match changeset" do
      match = match_fixture()
      assert %Ecto.Changeset{} = Matches.change_match(match)
    end
  end
end
