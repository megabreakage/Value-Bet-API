defmodule V8betApi.GamesTest do
  use V8betApi.DataCase

  alias V8betApi.Games

  describe "games" do
    alias V8betApi.Games.Game

    import V8betApi.GamesFixtures

    @invalid_attrs %{active: nil, deleted_at: nil, name: nil}

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Games.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Games.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      valid_attrs = %{active: true, deleted_at: ~U[2024-04-17 11:06:00Z], name: "some name"}

      assert {:ok, %Game{} = game} = Games.create_game(valid_attrs)
      assert game.active == true
      assert game.deleted_at == ~U[2024-04-17 11:06:00Z]
      assert game.name == "some name"
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()

      update_attrs = %{
        active: false,
        deleted_at: ~U[2024-04-18 11:06:00Z],
        name: "some updated name"
      }

      assert {:ok, %Game{} = game} = Games.update_game(game, update_attrs)
      assert game.active == false
      assert game.deleted_at == ~U[2024-04-18 11:06:00Z]
      assert game.name == "some updated name"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_game(game, @invalid_attrs)
      assert game == Games.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Games.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Games.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Games.change_game(game)
    end
  end
end
