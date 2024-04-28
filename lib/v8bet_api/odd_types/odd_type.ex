defmodule V8betApi.OddTypes.OddType do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :name]}
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "odd_types" do
    field :deleted_at, :utc_datetime
    field :name, :string

    # has_many :odds, V8betApi.Odds.Odd

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(odd_type, attrs) do
    odd_type
    |> cast(attrs, [:id, :name, :deleted_at])
    |> validate_required([:name])
  end
end
