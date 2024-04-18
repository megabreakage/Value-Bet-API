defmodule V8betApi.Users.UserRoles do
  use Ecto.Schema

  schema "user_roles" do
    belongs_to :user, V8betApi.User.User
    belongs_to :role, V8betApi.Roles.Role
    timestamps(type: :utc_datetime)
  end
end
