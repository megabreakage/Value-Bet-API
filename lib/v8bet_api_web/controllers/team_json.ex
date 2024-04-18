defmodule V8betApiWeb.TeamJSON do
  alias V8betApi.Teams.Team

  @doc """
  Renders a list of teams.
  """
  def index(%{teams: teams}) do
    %{data: for(team <- teams, do: data(team))}
  end

  @doc """
  Renders a single team.
  """
  def show(%{team: team}) do
    %{data: data(team)}
  end

  defp data(%Team{} = team) do
    %{
      id: team.id,
      name: team.name,
      biography: team.biography,
      active: team.active,
      deleted_at: team.deleted_at
    }
  end
end
