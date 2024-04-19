defmodule V8betApi.TransactionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `V8betApi.Transactions` context.
  """

  @doc """
  Generate a transaction.
  """
  def transaction_fixture(attrs \\ %{}) do
    {:ok, transaction} =
      attrs
      |> Enum.into(%{
        amount: 120.5,
        is_complete: true
      })
      |> V8betApi.Transactions.create_transaction()

    transaction
  end
end
