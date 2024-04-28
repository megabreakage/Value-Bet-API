defmodule V8betApiWeb.BetJSON do
  @doc """
  Renders a list of bets.
  """
  def index(%{bets: bets}) do
    %{data: for(bet <- bets, do: bet)}
  end

  @doc """
  Renders a single bet.
  """
  def show(%{bet: bet}) do
    %{data: bet}
  end

  # defp data(%Bet{} = bet) do
  #   %{
  #     id: bet.id,
  #     user_id: bet.user_id,
  #     match_id: bet.match_id,
  #     odd_id: bet.odd_id,
  #     bet_status_id: bet.bet_status_id,
  #     amount: bet.amount,
  #     start_time: bet.start_time,
  #     est_expires_at: bet.est_expires_at,
  #     updated_at: bet.updated_at,
  #     deleted_at: bet.deleted_at,
  #     expired_at: bet.expired_at
  #   }
  # end
end
