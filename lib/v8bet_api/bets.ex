defmodule V8betApi.Bets do
  @moduledoc """
  The Bets context.
  """

  import Ecto.Query, warn: false
  alias V8betApi.Repo

  alias V8betApi.Bets.Bet

  @doc """
  Returns the list of bets.

  ## Examples

      iex> list_bets()
      [%Bet{}, ...]

  """
  def list_bets do
    Repo.all(Bet)
    |> Repo.preload([
      :bet_status,
      user: [:account, :roles],
      match: [:teams, odds: :odd_type]
    ])
  end

  @doc """
  Gets a single bet.

  Raises `Ecto.NoResultsError` if the Bet does not exist.

  ## Examples

      iex> get_bet!(123)
      %Bet{}

      iex> get_bet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bet!(id),
    do:
      Repo.get!(Bet, id)
      |> Repo.preload([
        :bet_status,
        user: [:account, :roles],
        match: [:teams, odds: :odd_type]
      ])

  @doc """
  Creates a bet.

  ## Examples

      iex> create_bet(%{field: value})
      {:ok, %Bet{}}

      iex> create_bet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bet(attrs \\ %{}) do
    {:ok, bet} =
      %Bet{}
      |> Bet.changeset(attrs)
      |> Repo.insert()

    # Method 1:
    bet = bet |> Repo.preload([
      :bet_status, user: [:account, :roles], match: [:teams, odds: :odd_type]
    ])

    {:ok,
     %{
       id: bet.id,
       bet_status: bet.bet_status,
       user: bet.user,
       match: bet.match,
       amount: bet.amount,
       start_time: bet.start_time,
       est_expires_at: bet.est_expires_at,
       expired_at: bet.expired_at
     }}

    # Method 2:
    # bet_with_matches =
    #   from b in Bet,
    #     preload: [user: u, match: m, odds: o, bet_status: s],
    #     select: %{bet: b, user: u, match: m, odds: o, bet_status: s}

    # Query to fetch bets with their match and odds, user & bet_status preloaded

    # Method 3:
    # bet_with_matches =
    # from b in Bet,
    #     join: s in assoc(b, :bet_status),
    #     join: u in assoc(b, :user),
    #     join: m in assoc(b, :match),
    #     preload: [bet_status: s, user: u, match: m],
    #     select: %{bet: b, bet_status: s, user: u, match: m}

    # Execute the query
    # result = V8betApi.Repo.all(bet_with_matches)
    # {:ok, result}
  end

  @doc """
  Updates a bet.

  ## Examples

      iex> update_bet(bet, %{field: new_value})
      {:ok, %Bet{}}

      iex> update_bet(bet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bet(%Bet{} = bet, attrs) do
    bet
    |> Bet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bet.

  ## Examples

      iex> delete_bet(bet)
      {:ok, %Bet{}}

      iex> delete_bet(bet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bet(%Bet{} = bet) do
    Repo.delete(bet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bet changes.

  ## Examples

      iex> change_bet(bet)
      %Ecto.Changeset{data: %Bet{}}

  """
  def change_bet(%Bet{} = bet, attrs \\ %{}) do
    Bet.changeset(bet, attrs)
  end
end
