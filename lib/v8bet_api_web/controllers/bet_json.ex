defmodule V8betApiWeb.BetJSON do
  alias V8betApi.Bets.Bet

  @doc """
  Renders a list of bets.
  """
  def index(%{bets: bets}) do
    %{data: for(bet <- bets, do: data(bet))}
  end

  @doc """
  Renders a single bet.
  """
  def show(%{bet: bet}) do
    %{data: data(bet)}
  end

  defp data(%Bet{} = bet) do
    %{
      id: bet.id,
      amount: bet.amount,
      start_time: bet.start_time,
      expires_at: bet.expires_at
    }
  end
end
