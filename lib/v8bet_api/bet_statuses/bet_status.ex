defmodule V8betApi.BetStatuses.BetStatus do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "bet_statuses" do
    field :deleted_at, :utc_datetime
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(bet_status, attrs) do
    bet_status
    |> cast(attrs, [:name, :deleted_at])
    |> validate_required([:name])
  end
end
