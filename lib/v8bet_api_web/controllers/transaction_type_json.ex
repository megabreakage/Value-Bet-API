defmodule V8betApiWeb.TransactionTypeJSON do
  alias V8betApi.TransactionTypes.TransactionType

  @doc """
  Renders a list of transaction_types.
  """
  def index(%{transaction_types: transaction_types}) do
    %{data: for(transaction_type <- transaction_types, do: data(transaction_type))}
  end

  @doc """
  Renders a single transaction_type.
  """
  def show(%{transaction_type: transaction_type}) do
    %{data: data(transaction_type)}
  end

  defp data(%TransactionType{} = transaction_type) do
    %{
      id: transaction_type.id,
      name: transaction_type.name,
      description: transaction_type.description
    }
  end
end
