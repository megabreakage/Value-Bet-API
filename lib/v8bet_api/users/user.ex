defmodule V8betApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :firstname, :string
    field :lastname, :string
    field :msisdn, :integer
    belongs_to :account,  V8betApi.Accounts.Account

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:account_id, :firstname, :lastname, :msisdn])
    |> validate_required([:account_id])
  end
end
