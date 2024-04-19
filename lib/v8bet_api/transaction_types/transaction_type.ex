defmodule V8betApi.TransactionTypes.TransactionType do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "transaction_types" do
    field :deleted_at, :utc_datetime
    field :description, :string
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transaction_type, attrs) do
    transaction_type
    |> cast(attrs, [:name, :description, :deleted_at])
    |> validate_required([:name])
  end
end
