defmodule V8betApi.Bets.Bet do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder,
           only: [
             :id,
             :user,
             :match,
             :bet_status,
             :amount,
             :start_time,
             :est_expires_at,
             :expired_at
           ]}
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "bets" do
    field :amount, :float
    field :est_expires_at, :utc_datetime
    field :expired_at, :utc_datetime
    field :start_time, :utc_datetime
    field :updated_by, :binary_id
    field :deleted_at, :utc_datetime

    belongs_to :user, V8betApi.Users.User
    belongs_to :match, V8betApi.Matches.Match
    belongs_to :odd, V8betApi.Odds.Odd
    belongs_to :bet_status, V8betApi.BetStatuses.BetStatus

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(bet, attrs) do
    bet
    |> cast(attrs, [
      :user_id,
      :match_id,
      :odd_id,
      :bet_status_id,
      :amount,
      :start_time,
      :est_expires_at,
      :expired_at,
      :updated_by,
      :deleted_at
    ])
    |> validate_required([
      :user_id,
      :match_id,
      :odd_id,
      :bet_status_id,
      :amount,
      :start_time,
      :est_expires_at
    ])
  end

  def user_update_changeset(bet, attrs) do
    bet
    |> cast(attrs, [
      :odd_id,
      :amount,
      :bet_status_id,
      :updated_by,
    ])
    |> validate_required([
      :odd_id,
      :amount,
      :updated_by
    ])
  end

  def admin_update_changeset(bet, attrs) do
    bet
    |> cast(attrs, [
      :start_time,
      :est_expires_at,
      :expired_at,
      :updated_by,
      :bet_status_id,
      :updated_by,
    ])
    |> validate_required([
      :updated_by
    ])
  end
end
