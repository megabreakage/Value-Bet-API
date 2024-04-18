defmodule V8betApi.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "teams" do
    field :active, :boolean, default: false
    field :biography, :string
    field :deleted_at, :utc_datetime
    field :name, :string
    field :game_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :biography, :active, :deleted_at])
    |> validate_required([:name, :active, :game_id])
  end
end
