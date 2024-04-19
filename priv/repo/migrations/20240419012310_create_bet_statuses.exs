defmodule V8betApi.Repo.Migrations.CreateBetStatuses do
  use Ecto.Migration

  def change do
    create table(:bet_statuses, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :deleted_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
