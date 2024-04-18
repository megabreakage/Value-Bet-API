defmodule V8betApi.Roles do
  @moduledoc """
  The Roles context.
  """

  import Ecto.Query, warn: false
  alias V8betApi.Users.UserRoles
  alias V8betApi.Repo

  alias V8betApi.Users.User
  alias V8betApi.Roles.Role

  @doc """
  Returns the list of roles.

  ## Examples

      iex> list_roles()
      [%Role{}, ...]

  """
  def list_roles do
    Repo.all(Role)
  end

  @doc """
  Gets a single role.

  Raises `Ecto.NoResultsError` if the Role does not exist.

  ## Examples

      iex> get_role!(123)
      %Role{}

      iex> get_role!(456)
      ** (Ecto.NoResultsError)

  """
  def get_role!(id), do: Repo.get!(Role, id)

  @doc """
  Creates a role.

  ## Examples

      iex> create_role(%{field: value})
      {:ok, %Role{}}

      iex> create_role(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_role(attrs \\ %{}) do
    %Role{}
    |> Role.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a role.

  ## Examples

      iex> update_role(role, %{field: new_value})
      {:ok, %Role{}}

      iex> update_role(role, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_role(%Role{} = role, attrs) do
    role
    |> Role.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a role.

  ## Examples

      iex> delete_role(role)
      {:ok, %Role{}}

      iex> delete_role(role)
      {:error, %Ecto.Changeset{}}

  """
  def delete_role(%Role{} = role) do
    Repo.delete(role)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking role changes.

  ## Examples

      iex> change_role(role)
      %Ecto.Changeset{data: %Role{}}

  """
  def change_role(%Role{} = role, attrs \\ %{}) do
    Role.changeset(role, attrs)
  end

    @doc """
  Assigns a role to a user.

  ## Examples

      iex> assign_role(user, "admin")
      {:ok, %User{}}

      iex> assign_role(user, "user")
      {:ok, %User{}}

      iex> assign_role(user, "invalid_role")
      {:error, :invalid_role}
  """
  def assign_role(%User{} = user, role_name) do
    case get_role_by_name(role_name) do
      %Role{} = role ->
        {:ok, assign_role_to_user(user, role)}

      nil ->
        {:error, :invalid_role}
    end
  end

  # Fetch role by its name
  defp get_role_by_name(role_name) do
    Repo.get_by(Role, name: role_name)
  end

  # Assign role to a user
  defp assign_role_to_user(user, role) do
    case Repo.insert(%UserRoles{user_id: user.id, role_id: role.id}) do
      {:ok, _} ->
        {:ok, user}

      _ ->
        {:error, :role_assignment_failed}
    end
  end

  def assign_role_v2(user_id, role_name)do
    case get_role_by_name(role_name) do
      %Role{} = role ->
        {:ok, Repo.insert(%UserRoles{user_id: user_id, role_id: role.id})}
        nil -> {:error, :role_assignment_failed}
    end
  end
end
