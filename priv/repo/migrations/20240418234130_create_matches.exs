defmodule V8betApi.Repo.Migrations.CreateMatches do
  use Ecto.Migration

  def change do
    create table(:matches, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :scheduled_at, :utc_datetime
      add :deleted_at, :utc_datetime
      add :game_id, references(:games, on_delete: :nothing, type: :binary_id)
      add :home_team_id, references(:teams, on_delete: :nothing, type: :binary_id)
      add :away_team_id, references(:teams, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:matches, [:game_id])
    create index(:matches, [:home_team_id])
    create index(:matches, [:away_team_id])
  end
end
