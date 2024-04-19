defmodule V8betApi.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :biography, :string
      add :active, :boolean, default: false, null: false
      add :deleted_at, :utc_datetime
      add :game_id, references(:games, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:teams, [:game_id])
  end
end
