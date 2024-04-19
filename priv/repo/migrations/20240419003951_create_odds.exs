defmodule V8betApi.Repo.Migrations.CreateOdds do
  use Ecto.Migration

  def change do
    create table(:odds, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :value, :float
      add :deleted_at, :utc_datetime
      add :match_id, references(:matches, on_delete: :nothing, type: :binary_id)
      add :odd_type_id, references(:odd_types, on_delete: :nothing, type: :binary_id)
      add :added_by, references(:users, on_delete: :nothing, type: :binary_id)
      add :updated_by, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:odds, [:match_id])
    create index(:odds, [:odd_type_id])
    create index(:odds, [:added_by])
    create index(:odds, [:updated_by])
  end
end
