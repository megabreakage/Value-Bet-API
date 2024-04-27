defmodule V8betApi.Repo.Migrations.CreateMatches do
  use Ecto.Migration

  def change do
    create table(:matches, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :scheduled_at, :utc_datetime
      add :deleted_at, :utc_datetime
      add :game_id, references(:games, on_delete: :delete_all, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:matches, [:game_id])
  end
end
