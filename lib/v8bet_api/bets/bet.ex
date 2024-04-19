defmodule V8betApi.Bets.Bet do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "bets" do
    field :amount, :float
    field :est_expires_at, :utc_datetime
    field :expired_at, :utc_datetime
    field :start_time, :utc_datetime
    field :user_id, :binary_id
    field :match_id, :binary_id
    field :odd_id, :binary_id
    field :bet_status_id, :binary_id
    field :updated_by, :binary_id
    field :deleted_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(bet, attrs) do
    bet
    |> cast(attrs, [:user_id, :match_id, :odd_id, :bet_status_id, :amount, :start_time, :est_expires_at, :expired_at, :updated_by, :deleted_at])
    |> validate_required([:user_id, :match_id, :odd_id, :amount, :start_time, :est_expires_at])
  end
end
