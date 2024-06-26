defmodule V8betApiWeb.MatchJSON do
  @doc """
  Renders a list of matches.
  """
  def index(%{matches: matches}) do
    %{data: for(match <- matches, do: match)}
  end

  @doc """
  Renders a single match.
  """
  def show(%{match: match}) do
    %{data: match}
  end

  # defp data(%Match{} = match) do
  #   %{
  #     id: match.id,
  #     game_id: match.game_id,
  #     scheduled_at: match.scheduled_at,
  #     deleted_at: match.deleted_at
  #   }
  # end
end
