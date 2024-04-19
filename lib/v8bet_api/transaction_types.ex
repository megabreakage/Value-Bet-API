defmodule V8betApi.TransactionTypes do
  @moduledoc """
  The TransactionTypes context.
  """

  import Ecto.Query, warn: false
  alias V8betApi.Repo

  alias V8betApi.TransactionTypes.TransactionType

  @doc """
  Returns the list of transaction_types.

  ## Examples

      iex> list_transaction_types()
      [%TransactionType{}, ...]

  """
  def list_transaction_types do
    Repo.all(TransactionType)
  end

  @doc """
  Gets a single transaction_type.

  Raises `Ecto.NoResultsError` if the Transaction type does not exist.

  ## Examples

      iex> get_transaction_type!(123)
      %TransactionType{}

      iex> get_transaction_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transaction_type!(id), do: Repo.get!(TransactionType, id)

  @doc """
  Creates a transaction_type.

  ## Examples

      iex> create_transaction_type(%{field: value})
      {:ok, %TransactionType{}}

      iex> create_transaction_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transaction_type(attrs \\ %{}) do
    %TransactionType{}
    |> TransactionType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a transaction_type.

  ## Examples

      iex> update_transaction_type(transaction_type, %{field: new_value})
      {:ok, %TransactionType{}}

      iex> update_transaction_type(transaction_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_transaction_type(%TransactionType{} = transaction_type, attrs) do
    transaction_type
    |> TransactionType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a transaction_type.

  ## Examples

      iex> delete_transaction_type(transaction_type)
      {:ok, %TransactionType{}}

      iex> delete_transaction_type(transaction_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_transaction_type(%TransactionType{} = transaction_type) do
    Repo.delete(transaction_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking transaction_type changes.

  ## Examples

      iex> change_transaction_type(transaction_type)
      %Ecto.Changeset{data: %TransactionType{}}

  """
  def change_transaction_type(%TransactionType{} = transaction_type, attrs \\ %{}) do
    TransactionType.changeset(transaction_type, attrs)
  end
end
