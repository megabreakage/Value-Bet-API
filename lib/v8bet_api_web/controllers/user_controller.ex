defmodule V8betApiWeb.UserController do
  use V8betApiWeb, :controller

  alias V8betApi.Users
  alias V8betApi.Users.User
  alias V8betApi.Roles
  alias V8betApi.Auth.ErrorResponse

  action_fallback V8betApiWeb.FallbackController

  def index(conn, _params) do
    users = Users.list_users()
    render(conn, :index, users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Users.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/users/#{user}")
      |> render(:show, user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    render(conn, :show, user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Users.get_user!(id)

    with {:ok, %User{} = user} <- Users.update_user(user, user_params) do
      render(conn, :show, user: user)
    end
  end

  def assign_role(conn, %{"user_id" => user_id, "role_name" => role_name}) do
    user = Users.get_user!(user_id)
    case Roles.assign_role_v2(user.id, role_name) do
      {:ok, _} ->
        conn
        |> put_status(:ok)
        |> render(:show, user: user)

      {:error, :assign_role_failed} ->
        raise ErrorResponse.AssignRoleFailed, message: "Assign user a role failed."
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Users.get_user!(id)

    with {:ok, %User{}} <- Users.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
