defmodule V8betApiWeb.TransactionJSON do
  alias V8betApi.Transactions.Transaction

  @doc """
  Renders a list of transactions.
  """
  def index(%{transactions: transactions}) do
    %{data: for(transaction <- transactions, do: data(transaction))}
  end

  @doc """
  Renders a single transaction.
  """
  def show(%{transaction: transaction}) do
    %{data: data(transaction)}
  end

  defp data(%Transaction{} = transaction) do
    %{
      id: transaction.id,
      amount: transaction.amount,
      user_id: transaction.user_id,
      transaction_type_id: transaction.transaction_type_id,
      is_complete: transaction.is_complete,
      updated_by: transaction.updated_by
    }
  end
end
