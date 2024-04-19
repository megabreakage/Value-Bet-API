defmodule V8betApiWeb.OddControllerTest do
  use V8betApiWeb.ConnCase

  import V8betApi.OddsFixtures

  alias V8betApi.Odds.Odd

  @create_attrs %{
    deleted_at: ~U[2024-04-18 00:39:00Z],
    value: 120.5
  }
  @update_attrs %{
    deleted_at: ~U[2024-04-19 00:39:00Z],
    value: 456.7
  }
  @invalid_attrs %{deleted_at: nil, value: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all odds", %{conn: conn} do
      conn = get(conn, ~p"/api/odds")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create odd" do
    test "renders odd when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/odds", odd: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/odds/#{id}")

      assert %{
               "id" => ^id,
               "deleted_at" => "2024-04-18T00:39:00Z",
               "value" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/odds", odd: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update odd" do
    setup [:create_odd]

    test "renders odd when data is valid", %{conn: conn, odd: %Odd{id: id} = odd} do
      conn = put(conn, ~p"/api/odds/#{odd}", odd: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/odds/#{id}")

      assert %{
               "id" => ^id,
               "deleted_at" => "2024-04-19T00:39:00Z",
               "value" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, odd: odd} do
      conn = put(conn, ~p"/api/odds/#{odd}", odd: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete odd" do
    setup [:create_odd]

    test "deletes chosen odd", %{conn: conn, odd: odd} do
      conn = delete(conn, ~p"/api/odds/#{odd}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/odds/#{odd}")
      end
    end
  end

  defp create_odd(_) do
    odd = odd_fixture()
    %{odd: odd}
  end
end
