defmodule V8betApiWeb.BetController do
  use V8betApiWeb, :controller

  alias V8betApi.Bets
  alias V8betApi.Bets.Bet

  action_fallback V8betApiWeb.FallbackController

  def index(conn, _params) do
    bets = Bets.list_bets()
    render(conn, :index, bets: bets)
  end

  def create(conn, %{"bet" => bet_params}) do
    with {:ok, bet} <- Bets.create_bet(bet_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", ~p"/api/bets/#{bet}")
      |> render(:show, bet: bet)
    end
  end

  def show(conn, %{"id" => id}) do
    bet = Bets.get_bet!(id)
    render(conn, :show, bet: bet)
  end

  def update(conn, %{"id" => id, "bet" => bet_params}) do
    bet = Bets.get_bet!(id)

    with {:ok, %Bet{} = bet} <- Bets.update_bet(bet, bet_params) do
      render(conn, :show, bet: bet)
    end
  end

  def delete(conn, %{"id" => id}) do
    bet = Bets.get_bet!(id)

    with {:ok, %Bet{}} <- Bets.delete_bet(bet) do
      send_resp(conn, :no_content, "")
    end
  end
end
