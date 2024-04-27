defmodule V8betApi.OddTypes do
  @moduledoc """
  The OddTypes context.
  """

  import Ecto.Query, warn: false
  alias V8betApi.Repo

  alias V8betApi.OddTypes.OddType

  @doc """
  Returns the list of odd_types.

  ## Examples

      iex> list_odd_types()
      [%OddType{}, ...]

  """
  def list_odd_types do
    Repo.all(OddType) |> Repo.preload(:odds)
  end

  @doc """
  Gets a single odd_type.

  Raises `Ecto.NoResultsError` if the Odd type does not exist.

  ## Examples

      iex> get_odd_type!(123)
      %OddType{}

      iex> get_odd_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_odd_type!(id), do: Repo.get!(OddType, id) |> Repo.preload(:odds)

  @doc """
  Creates a odd_type.

  ## Examples

      iex> create_odd_type(%{field: value})
      {:ok, %OddType{}}

      iex> create_odd_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_odd_type(attrs \\ %{}) do
    %OddType{}
    |> OddType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a odd_type.

  ## Examples

      iex> update_odd_type(odd_type, %{field: new_value})
      {:ok, %OddType{}}

      iex> update_odd_type(odd_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_odd_type(%OddType{} = odd_type, attrs) do
    odd_type
    |> OddType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a odd_type.

  ## Examples

      iex> delete_odd_type(odd_type)
      {:ok, %OddType{}}

      iex> delete_odd_type(odd_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_odd_type(%OddType{} = odd_type) do
    Repo.delete(odd_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking odd_type changes.

  ## Examples

      iex> change_odd_type(odd_type)
      %Ecto.Changeset{data: %OddType{}}

  """
  def change_odd_type(%OddType{} = odd_type, attrs \\ %{}) do
    OddType.changeset(odd_type, attrs)
  end
end
