defmodule V8betApi.Odds.Odd do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "odds" do
    field :deleted_at, :utc_datetime
    field :value, :float
    field :match_id, :binary_id
    field :odd_type_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(odd, attrs) do
    odd
    |> cast(attrs, [:value, :deleted_at])
    |> validate_required([:value, :deleted_at])
  end
end
