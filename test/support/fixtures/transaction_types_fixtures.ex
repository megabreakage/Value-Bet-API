defmodule V8betApi.TransactionTypesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `V8betApi.TransactionTypes` context.
  """

  @doc """
  Generate a transaction_type.
  """
  def transaction_type_fixture(attrs \\ %{}) do
    {:ok, transaction_type} =
      attrs
      |> Enum.into(%{
        deleted_at: ~U[2024-04-18 02:36:00Z],
        description: "some description",
        name: "some name"
      })
      |> V8betApi.TransactionTypes.create_transaction_type()

    transaction_type
  end
end
