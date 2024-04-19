defmodule V8betApiWeb.OddController do
  use V8betApiWeb, :controller

  alias V8betApi.Odds
  alias V8betApi.Odds.Odd

  action_fallback V8betApiWeb.FallbackController

  def index(conn, _params) do
    odds = Odds.list_odds()
    render(conn, :index, odds: odds)
  end

  def create(conn, %{"odd" => odd_params}) do
    with {:ok, %Odd{} = odd} <- Odds.create_odd(odd_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/odds/#{odd}")
      |> render(:show, odd: odd)
    end
  end

  def show(conn, %{"id" => id}) do
    odd = Odds.get_odd!(id)
    render(conn, :show, odd: odd)
  end

  def update(conn, %{"id" => id, "odd" => odd_params}) do
    odd = Odds.get_odd!(id)

    with {:ok, %Odd{} = odd} <- Odds.update_odd(odd, odd_params) do
      render(conn, :show, odd: odd)
    end
  end

  def delete(conn, %{"id" => id}) do
    odd = Odds.get_odd!(id)

    with {:ok, %Odd{}} <- Odds.delete_odd(odd) do
      send_resp(conn, :no_content, "")
    end
  end
end
