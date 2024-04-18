defmodule V8betApiWeb.GameJSON do
  alias V8betApi.Games.Game

  @doc """
  Renders a list of games.
  """
  def index(%{games: games}) do
    %{data: for(game <- games, do: data(game))}
  end

  @doc """
  Renders a single game.
  """
  def show(%{game: game}) do
    %{data: data(game)}
  end

  defp data(%Game{} = game) do
    %{
      id: game.id,
      name: game.name,
      active: game.active,
      deleted_at: game.deleted_at
    }
  end
end
