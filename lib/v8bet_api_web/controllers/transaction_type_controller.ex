defmodule V8betApiWeb.TransactionTypeController do
  use V8betApiWeb, :controller

  alias V8betApi.TransactionTypes
  alias V8betApi.TransactionTypes.TransactionType

  action_fallback V8betApiWeb.FallbackController

  def index(conn, _params) do
    transaction_types = TransactionTypes.list_transaction_types()
    render(conn, :index, transaction_types: transaction_types)
  end

  def create(conn, %{"transaction_type" => transaction_type_params}) do
    with {:ok, %TransactionType{} = transaction_type} <- TransactionTypes.create_transaction_type(transaction_type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/transaction_types/#{transaction_type}")
      |> render(:show, transaction_type: transaction_type)
    end
  end

  def show(conn, %{"id" => id}) do
    transaction_type = TransactionTypes.get_transaction_type!(id)
    render(conn, :show, transaction_type: transaction_type)
  end

  def update(conn, %{"id" => id, "transaction_type" => transaction_type_params}) do
    transaction_type = TransactionTypes.get_transaction_type!(id)

    with {:ok, %TransactionType{} = transaction_type} <- TransactionTypes.update_transaction_type(transaction_type, transaction_type_params) do
      render(conn, :show, transaction_type: transaction_type)
    end
  end

  def delete(conn, %{"id" => id}) do
    transaction_type = TransactionTypes.get_transaction_type!(id)

    with {:ok, %TransactionType{}} <- TransactionTypes.delete_transaction_type(transaction_type) do
      send_resp(conn, :no_content, "")
    end
  end
end
