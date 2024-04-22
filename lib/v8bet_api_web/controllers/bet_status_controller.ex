defmodule V8betApiWeb.BetStatusController do
  use V8betApiWeb, :controller

  alias V8betApi.BetStatuses
  alias V8betApi.BetStatuses.BetStatus

  action_fallback V8betApiWeb.FallbackController

  def index(conn, _params) do
    bet_statuses = BetStatuses.list_bet_statuses()
    render(conn, :index, bet_statuses: bet_statuses)
  end

  def create(conn, %{"bet_status" => bet_status_params}) do
    with {:ok, %BetStatus{} = bet_status} <- BetStatuses.create_bet_status(bet_status_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/bet_statuses/#{bet_status}")
      |> render(:show, bet_status: bet_status)
    end
  end

  def show(conn, %{"id" => id}) do
    bet_status = BetStatuses.get_bet_status!(id)
    render(conn, :show, bet_status: bet_status)
  end

  def update(conn, %{"id" => id, "bet_status" => bet_status_params}) do
    bet_status = BetStatuses.get_bet_status!(id)

    with {:ok, %BetStatus{} = bet_status} <-
           BetStatuses.update_bet_status(bet_status, bet_status_params) do
      render(conn, :show, bet_status: bet_status)
    end
  end

  def delete(conn, %{"id" => id}) do
    bet_status = BetStatuses.get_bet_status!(id)

    with {:ok, %BetStatus{}} <- BetStatuses.delete_bet_status(bet_status) do
      send_resp(conn, :no_content, "")
    end
  end
end
