defmodule V8betApi.Odds.Odd do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :value, :odd_type]}
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "odds" do
    field :deleted_at, :utc_datetime
    field :value, :float
    field :added_by, :binary_id
    field :updated_by, :binary_id

    belongs_to :odd_type, V8betApi.OddTypes.OddType
    belongs_to :match, V8betApi.Matches.Match

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(odd, attrs) do
    odd
    |> cast(attrs, [:match_id, :value, :odd_type_id, :added_by, :updated_by, :deleted_at])
    |> validate_required([:match_id, :value, :added_by])
  end
end
