defmodule V8betApi.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "accounts" do
    field :email, :string
    field :hash_password, :string

    has_one :user, V8betApi.Users.User # Creates relationship to users module

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:email, :hash_password])
    |> validate_required([:email, :hash_password])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: " must have the @sign and no spaces")
    |> validate_length(:email, max: 160, message: "must be less than 160 characters")
    |> unique_constraint(:email, message: " already exists")
  end
end
