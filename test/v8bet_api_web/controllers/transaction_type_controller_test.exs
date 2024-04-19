defmodule V8betApiWeb.TransactionTypeControllerTest do
  use V8betApiWeb.ConnCase

  import V8betApi.TransactionTypesFixtures

  alias V8betApi.TransactionTypes.TransactionType

  @create_attrs %{
    deleted_at: ~U[2024-04-18 02:36:00Z],
    description: "some description",
    name: "some name"
  }
  @update_attrs %{
    deleted_at: ~U[2024-04-19 02:36:00Z],
    description: "some updated description",
    name: "some updated name"
  }
  @invalid_attrs %{deleted_at: nil, description: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all transaction_types", %{conn: conn} do
      conn = get(conn, ~p"/api/transaction_types")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create transaction_type" do
    test "renders transaction_type when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/transaction_types", transaction_type: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/transaction_types/#{id}")

      assert %{
               "id" => ^id,
               "deleted_at" => "2024-04-18T02:36:00Z",
               "description" => "some description",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/transaction_types", transaction_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update transaction_type" do
    setup [:create_transaction_type]

    test "renders transaction_type when data is valid", %{conn: conn, transaction_type: %TransactionType{id: id} = transaction_type} do
      conn = put(conn, ~p"/api/transaction_types/#{transaction_type}", transaction_type: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/transaction_types/#{id}")

      assert %{
               "id" => ^id,
               "deleted_at" => "2024-04-19T02:36:00Z",
               "description" => "some updated description",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, transaction_type: transaction_type} do
      conn = put(conn, ~p"/api/transaction_types/#{transaction_type}", transaction_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete transaction_type" do
    setup [:create_transaction_type]

    test "deletes chosen transaction_type", %{conn: conn, transaction_type: transaction_type} do
      conn = delete(conn, ~p"/api/transaction_types/#{transaction_type}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/transaction_types/#{transaction_type}")
      end
    end
  end

  defp create_transaction_type(_) do
    transaction_type = transaction_type_fixture()
    %{transaction_type: transaction_type}
  end
end
