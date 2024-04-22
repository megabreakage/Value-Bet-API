defmodule V8betApiWeb.TeamJSON do

  @doc """
  Renders a list of teams.
  """
  def index(%{teams: teams}) do
    # %{data: for(team <- teams, do: data(team))}
    %{data: for(team <- teams, do: team)}
  end

  @doc """
  Renders a single team.
  """
  def show(%{team: team}) do
    %{data: team}
  end

  # defp data(%Team{} = team) do
  #   %{
  #     id: team.id,
  #     game_id: team.game.id,
  #     name: team.name,
  #     biography: team.biography,
  #     active: team.active,
  #     deleted_at: team.deleted_at
  #   }
  # end
end
