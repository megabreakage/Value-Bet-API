defmodule V8betApi.Matches.Match do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "matches" do
    field :deleted_at, :utc_datetime
    field :scheduled_at, :utc_datetime
    field :game_id, :binary_id
    field :home_team_id, :binary_id
    field :away_team_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(match, attrs) do
    match
    |> cast(attrs, [:game_id, :home_team_id, :away_team_id, :scheduled_at, :deleted_at])
    |> validate_required([:game_id, :home_team_id, :away_team_id, :scheduled_at ])
  end
end
