defmodule V8betApi.Repo.Migrations.CreateMatchTeams do
  use Ecto.Migration

  def change do
    create table(:match_teams, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :match_id, references(:matches, on_delete: :delete_all, type: :binary_id)
      add :team_id, references(:teams, on_delete: :delete_all, type: :binary_id)
      add :home, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end

    create index(:match_teams, [:match_id])
    create index(:match_teams, [:team_id])
  end
end
