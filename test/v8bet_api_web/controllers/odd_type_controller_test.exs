defmodule V8betApiWeb.OddTypeControllerTest do
  use V8betApiWeb.ConnCase

  import V8betApi.OddTypesFixtures

  alias V8betApi.OddTypes.OddType

  @create_attrs %{
    deleted_at: ~U[2024-04-18 00:27:00Z],
    name: "some name"
  }
  @update_attrs %{
    deleted_at: ~U[2024-04-19 00:27:00Z],
    name: "some updated name"
  }
  @invalid_attrs %{deleted_at: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all odd_types", %{conn: conn} do
      conn = get(conn, ~p"/api/odd_types")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create odd_type" do
    test "renders odd_type when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/odd_types", odd_type: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/odd_types/#{id}")

      assert %{
               "id" => ^id,
               "deleted_at" => "2024-04-18T00:27:00Z",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/odd_types", odd_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update odd_type" do
    setup [:create_odd_type]

    test "renders odd_type when data is valid", %{
      conn: conn,
      odd_type: %OddType{id: id} = odd_type
    } do
      conn = put(conn, ~p"/api/odd_types/#{odd_type}", odd_type: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/odd_types/#{id}")

      assert %{
               "id" => ^id,
               "deleted_at" => "2024-04-19T00:27:00Z",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, odd_type: odd_type} do
      conn = put(conn, ~p"/api/odd_types/#{odd_type}", odd_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete odd_type" do
    setup [:create_odd_type]

    test "deletes chosen odd_type", %{conn: conn, odd_type: odd_type} do
      conn = delete(conn, ~p"/api/odd_types/#{odd_type}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/odd_types/#{odd_type}")
      end
    end
  end

  defp create_odd_type(_) do
    odd_type = odd_type_fixture()
    %{odd_type: odd_type}
  end
end
