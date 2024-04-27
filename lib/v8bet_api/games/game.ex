defmodule V8betApi.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder,
           only: [
             :id,
             :name,
             :active,
             :teams
           ]}
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "games" do
    field :active, :boolean, default: false
    field :deleted_at, :utc_datetime
    field :name, :string

    has_many :teams, V8betApi.Teams.Team
    # has_many :matches, V8betApi.Matches.Match

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :active, :deleted_at])
    |> validate_required([:name, :active])
  end
end
