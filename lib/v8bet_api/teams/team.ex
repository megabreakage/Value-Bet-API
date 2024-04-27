defmodule V8betApi.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :name, :biography, :active, :deleted_at, :game, :matches]}
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "teams" do
    field :active, :boolean, default: false
    field :biography, :string
    field :deleted_at, :utc_datetime
    field :name, :string

    belongs_to :game, V8betApi.Games.Game
    many_to_many :matches, V8betApi.Matches.Match, join_through: "match_teams"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :biography, :active, :deleted_at, :game_id])
    |> validate_required([:name, :active, :game_id])
  end
end
