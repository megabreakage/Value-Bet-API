defmodule V8betApi.Repo.Migrations.CreateTransactionTypes do
  use Ecto.Migration

  def change do
    create table(:transaction_types, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :string
      add :deleted_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
