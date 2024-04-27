defmodule V8betApiWeb.GameJSON do
  @doc """
  Renders a list of games.
  """
  def index(%{games: games}) do
    # %{data: for(game <- games, do: data(game))}
    %{data: for(game <- games, do: game)}
  end

  @doc """
  Renders a single game.
  """
  def show(%{game: game}) do
    %{data: game}
  end

  # defp data(%Game{} = game) do
  #   %{
  #     id: game.id,
  #     name: game.name,
  #     active: game.active,
  #     deleted_at: game.deleted_at
  #   }
  # end
end
