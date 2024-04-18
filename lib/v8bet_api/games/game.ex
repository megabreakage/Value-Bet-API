defmodule V8betApi.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "games" do
    field :active, :boolean, default: false
    field :deleted_at, :utc_datetime
    field :name, :string

    belongs_to :user, V8betApi.Users.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :active, :deleted_at])
    |> validate_required([:name, :active])
  end
end
