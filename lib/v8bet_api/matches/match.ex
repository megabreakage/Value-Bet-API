defmodule V8betApi.Matches.Match do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:game_id, :team, :scheduled_at, :deleted_at, :game]}
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "matches" do
    field :deleted_at, :utc_datetime
    field :scheduled_at, :utc_datetime
    field :home_team_id, :binary_id
    field :away_team_id, :binary_id

    belongs_to :game, V8betApi.Games.Game
    belongs_to :team, V8betApi.Teams.Team

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(match, attrs) do
    match
    |> cast(attrs, [:game_id, :home_team_id, :away_team_id, :scheduled_at, :deleted_at])
    |> validate_required([:game_id, :home_team_id, :away_team_id, :scheduled_at])
  end
end
