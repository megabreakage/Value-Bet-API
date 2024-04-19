defmodule V8betApi.BetStatuses do
  @moduledoc """
  The BetStatuses context.
  """

  import Ecto.Query, warn: false
  alias V8betApi.Repo

  alias V8betApi.BetStatuses.BetStatus

  @doc """
  Returns the list of bet_statuses.

  ## Examples

      iex> list_bet_statuses()
      [%BetStatus{}, ...]

  """
  def list_bet_statuses do
    Repo.all(BetStatus)
  end

  @doc """
  Gets a single bet_status.

  Raises `Ecto.NoResultsError` if the Bet status does not exist.

  ## Examples

      iex> get_bet_status!(123)
      %BetStatus{}

      iex> get_bet_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bet_status!(id), do: Repo.get!(BetStatus, id)

  @doc """
  Creates a bet_status.

  ## Examples

      iex> create_bet_status(%{field: value})
      {:ok, %BetStatus{}}

      iex> create_bet_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bet_status(attrs \\ %{}) do
    %BetStatus{}
    |> BetStatus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bet_status.

  ## Examples

      iex> update_bet_status(bet_status, %{field: new_value})
      {:ok, %BetStatus{}}

      iex> update_bet_status(bet_status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bet_status(%BetStatus{} = bet_status, attrs) do
    bet_status
    |> BetStatus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bet_status.

  ## Examples

      iex> delete_bet_status(bet_status)
      {:ok, %BetStatus{}}

      iex> delete_bet_status(bet_status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bet_status(%BetStatus{} = bet_status) do
    Repo.delete(bet_status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bet_status changes.

  ## Examples

      iex> change_bet_status(bet_status)
      %Ecto.Changeset{data: %BetStatus{}}

  """
  def change_bet_status(%BetStatus{} = bet_status, attrs \\ %{}) do
    BetStatus.changeset(bet_status, attrs)
  end
end
