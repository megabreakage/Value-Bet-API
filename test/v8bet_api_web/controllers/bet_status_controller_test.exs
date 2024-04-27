defmodule V8betApiWeb.BetStatusControllerTest do
  use V8betApiWeb.ConnCase

  import V8betApi.BetStatusesFixtures

  alias V8betApi.BetStatuses.BetStatus

  @create_attrs %{
    deleted_at: ~U[2024-04-18 01:23:00Z],
    name: "some name"
  }
  @update_attrs %{
    deleted_at: ~U[2024-04-19 01:23:00Z],
    name: "some updated name"
  }
  @invalid_attrs %{deleted_at: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all bet_statuses", %{conn: conn} do
      conn = get(conn, ~p"/api/bet_statuses")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create bet_status" do
    test "renders bet_status when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/bet_statuses", bet_status: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/bet_statuses/#{id}")

      assert %{
               "id" => ^id,
               "deleted_at" => "2024-04-18T01:23:00Z",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/bet_statuses", bet_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update bet_status" do
    setup [:create_bet_status]

    test "renders bet_status when data is valid", %{
      conn: conn,
      bet_status: %BetStatus{id: id} = bet_status
    } do
      conn = put(conn, ~p"/api/bet_statuses/#{bet_status}", bet_status: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/bet_statuses/#{id}")

      assert %{
               "id" => ^id,
               "deleted_at" => "2024-04-19T01:23:00Z",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, bet_status: bet_status} do
      conn = put(conn, ~p"/api/bet_statuses/#{bet_status}", bet_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete bet_status" do
    setup [:create_bet_status]

    test "deletes chosen bet_status", %{conn: conn, bet_status: bet_status} do
      conn = delete(conn, ~p"/api/bet_statuses/#{bet_status}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/bet_statuses/#{bet_status}")
      end
    end
  end

  defp create_bet_status(_) do
    bet_status = bet_status_fixture()
    %{bet_status: bet_status}
  end
end
