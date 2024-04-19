defmodule V8betApi.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :amount, :float
      add :is_complete, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :transaction_type_id, references(:transaction_types, on_delete: :nothing, type: :binary_id)
      add :added_by, references(:users, on_delete: :nothing, type: :binary_id)
      add :updated_by, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:transactions, [:user_id])
    create index(:transactions, [:transaction_type_id])
    create index(:transactions, [:added_by])
    create index(:transactions, [:updated_by])
  end
end
