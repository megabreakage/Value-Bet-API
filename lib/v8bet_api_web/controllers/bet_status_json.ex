defmodule V8betApiWeb.BetStatusJSON do
  alias V8betApi.BetStatuses.BetStatus

  @doc """
  Renders a list of bet_statuses.
  """
  def index(%{bet_statuses: bet_statuses}) do
    %{data: for(bet_status <- bet_statuses, do: data(bet_status))}
  end

  @doc """
  Renders a single bet_status.
  """
  def show(%{bet_status: bet_status}) do
    %{data: data(bet_status)}
  end

  defp data(%BetStatus{} = bet_status) do
    %{
      id: bet_status.id,
      name: bet_status.name,
    }
  end
end
