defmodule V8betApi.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :active, :boolean, default: false, null: false
      add :deleted_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
