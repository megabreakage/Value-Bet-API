defmodule V8betApiWeb.GameControllerTest do
  use V8betApiWeb.ConnCase

  import V8betApi.GamesFixtures

  alias V8betApi.Games.Game

  @create_attrs %{
    active: true,
    deleted_at: ~U[2024-04-17 11:06:00Z],
    name: "some name"
  }
  @update_attrs %{
    active: false,
    deleted_at: ~U[2024-04-18 11:06:00Z],
    name: "some updated name"
  }
  @invalid_attrs %{active: nil, deleted_at: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all games", %{conn: conn} do
      conn = get(conn, ~p"/api/games")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create game" do
    test "renders game when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/games", game: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/games/#{id}")

      assert %{
               "id" => ^id,
               "active" => true,
               "deleted_at" => "2024-04-17T11:06:00Z",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/games", game: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update game" do
    setup [:create_game]

    test "renders game when data is valid", %{conn: conn, game: %Game{id: id} = game} do
      conn = put(conn, ~p"/api/games/#{game}", game: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/games/#{id}")

      assert %{
               "id" => ^id,
               "active" => false,
               "deleted_at" => "2024-04-18T11:06:00Z",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, game: game} do
      conn = put(conn, ~p"/api/games/#{game}", game: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete game" do
    setup [:create_game]

    test "deletes chosen game", %{conn: conn, game: game} do
      conn = delete(conn, ~p"/api/games/#{game}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/games/#{game}")
      end
    end
  end

  defp create_game(_) do
    game = game_fixture()
    %{game: game}
  end
end
