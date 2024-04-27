defmodule V8betApi.Matches do
  @moduledoc """
  The Matches context.
  """

  import Ecto.Query, warn: false

  alias V8betApi.Repo

  alias V8betApi.Matches.Match
  alias V8betApi.Matches.MatchTeam

  @doc """
  Returns the list of matches.

  ## Examples

      iex> list_matches()
      [%Match{}, ...]

  """
  def list_matches do
    Repo.all(Match) |> Repo.preload([:game, :teams, :odds])
  end

  @doc """
  Gets a single match.

  Raises `Ecto.NoResultsError` if the Match does not exist.

  ## Examples

      iex> get_match!(123)
      %Match{}

      iex> get_match!(456)
      ** (Ecto.NoResultsError)

  """
  def get_match!(id), do: Repo.get!(Match, id) |> Repo.preload([:game, :teams, :odds])

  @doc """
  Creates a match.

  ## Examples

      iex> create_match(%{field: value})
      {:ok, %Match{}}

      iex> create_match(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_match(attrs \\ %{}) do
    match_changeset =
      %Match{}
      |> Match.changeset(attrs)
      |> Repo.insert()

      case match_changeset do
        {:ok, match} ->
          home = true
        case set_match_team(match.id, attrs["home_team_id"], home) do
          {:ok, %MatchTeam{}} = _match_teams ->
            set_match_team(match.id, attrs["away_team_id"], !home)
            {:ok, match |> Repo.preload([:odds, teams: :game])}
        end
    end
  end

  defp set_match_team(match_id, team_id, home) do
    %MatchTeam{match_id: match_id, team_id: team_id, home: home}
    |> Repo.insert()
  end

  @doc """
  Updates a match.

  ## Examples

      iex> update_match(match, %{field: new_value})
      {:ok, %Match{}}

      iex> update_match(match, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_match(%Match{} = match, attrs) do
    match
    |> Match.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a match.

  ## Examples

      iex> delete_match(match)
      {:ok, %Match{}}

      iex> delete_match(match)
      {:error, %Ecto.Changeset{}}

  """
  def delete_match(%Match{} = match) do
    Repo.delete(match)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking match changes.

  ## Examples

      iex> change_match(match)
      %Ecto.Changeset{data: %Match{}}

  """
  def change_match(%Match{} = match, attrs \\ %{}) do
    Match.changeset(match, attrs)
  end
end
