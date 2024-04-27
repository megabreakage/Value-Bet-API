defmodule V8betApi.Users.UserRoles do
  use Ecto.Schema

  @derive {Jason.Encoder, only: [:user_id, :role_id]}
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "user_roles" do
    belongs_to :user, V8betApi.Users.User
    belongs_to :role, V8betApi.Roles.Role
    timestamps(type: :utc_datetime)
  end
end
