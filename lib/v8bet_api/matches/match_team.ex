defmodule V8betApi.Matches.MatchTeam do
  use Ecto.Schema

  @derive {Jason.Encoder, only: [:match_id, :team_id]}
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "match_teams" do
    belongs_to :match, V8betApi.Matches.Match
    belongs_to :team, V8betApi.Teams.Team
    timestamps(type: :utc_datetime)
  end
end
