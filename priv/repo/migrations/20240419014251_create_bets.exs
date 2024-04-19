defmodule V8betApi.Repo.Migrations.CreateBets do
  use Ecto.Migration

  def change do
    create table(:bets, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :match_id, references(:matches, on_delete: :nothing, type: :binary_id)
      add :odd_id, references(:odds, on_delete: :nothing, type: :binary_id)
      add :amount, :float
      add :start_time, :utc_datetime
      add :est_expires_at, :utc_datetime
      add :expired_at, :utc_datetime
      add :bet_status_id, references(:bet_statuses, on_delete: :nothing, type: :binary_id)
      add :added_by, references(:users, on_delete: :nothing, type: :binary_id)
      add :updated_by, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:bets, [:user_id])
    create index(:bets, [:match_id])
    create index(:bets, [:odd_id])
    create index(:bets, [:bet_status_id])
    create index(:bets, [:added_by])
    create index(:bets, [:updated_by])
  end
end
