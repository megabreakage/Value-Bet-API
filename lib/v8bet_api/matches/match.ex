defmodule V8betApi.Matches.Match do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :game, :scheduled_at, :deleted_at, :teams, :odds]}
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "matches" do
    field :deleted_at, :utc_datetime
    field :scheduled_at, :utc_datetime

    belongs_to :game, V8betApi.Games.Game
    many_to_many :teams, V8betApi.Teams.Team, join_through: "match_teams"
    has_many :odds, V8betApi.Odds.Odd

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(match, attrs) do
    match
    |> cast(attrs, [:game_id, :scheduled_at, :deleted_at])
    |> validate_required([:game_id, :scheduled_at])
    |> cast_assoc(:game)
  end
end
