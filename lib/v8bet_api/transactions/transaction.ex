defmodule V8betApi.Transactions.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "transactions" do
    field :amount, :float
    field :is_complete, :boolean, default: false
    field :user_id, :binary_id
    field :transaction_type_id, :binary_id
    field :added_by, :binary_id
    field :updated_by, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:user_id, :transaction_type_id, :added_by, :updated_by, :amount, :is_complete])
    |> validate_required([:amount, :user_id, :transaction_type_id])
  end
end
