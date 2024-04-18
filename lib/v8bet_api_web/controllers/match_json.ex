defmodule V8betApiWeb.MatchJSON do
  alias V8betApi.Matches.Match

  @doc """
  Renders a list of matches.
  """
  def index(%{matches: matches}) do
    %{data: for(match <- matches, do: data(match))}
  end

  @doc """
  Renders a single match.
  """
  def show(%{match: match}) do
    %{data: data(match)}
  end

  defp data(%Match{} = match) do
    %{
      id: match.id,
      scheduled_at: match.scheduled_at,
      deleted_at: match.deleted_at
    }
  end
end
