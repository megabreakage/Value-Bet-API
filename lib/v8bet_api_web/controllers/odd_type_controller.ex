defmodule V8betApiWeb.OddTypeController do
  use V8betApiWeb, :controller

  alias V8betApi.OddTypes
  alias V8betApi.OddTypes.OddType

  action_fallback V8betApiWeb.FallbackController

  def index(conn, _params) do
    odd_types = OddTypes.list_odd_types()
    render(conn, :index, odd_types: odd_types)
  end

  def create(conn, %{"odd_type" => odd_type_params}) do
    with {:ok, %OddType{} = odd_type} <- OddTypes.create_odd_type(odd_type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/odd_types/#{odd_type}")
      |> render(:show, odd_type: odd_type)
    end
  end

  def show(conn, %{"id" => id}) do
    odd_type = OddTypes.get_odd_type!(id)
    render(conn, :show, odd_type: odd_type)
  end

  def update(conn, %{"id" => id, "odd_type" => odd_type_params}) do
    odd_type = OddTypes.get_odd_type!(id)

    with {:ok, %OddType{} = odd_type} <- OddTypes.update_odd_type(odd_type, odd_type_params) do
      render(conn, :show, odd_type: odd_type)
    end
  end

  def delete(conn, %{"id" => id}) do
    odd_type = OddTypes.get_odd_type!(id)

    with {:ok, %OddType{}} <- OddTypes.delete_odd_type(odd_type) do
      send_resp(conn, :no_content, "")
    end
  end
end
