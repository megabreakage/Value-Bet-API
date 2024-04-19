defmodule V8betApi.TransactionTypesTest do
  use V8betApi.DataCase

  alias V8betApi.TransactionTypes

  describe "transaction_types" do
    alias V8betApi.TransactionTypes.TransactionType

    import V8betApi.TransactionTypesFixtures

    @invalid_attrs %{deleted_at: nil, description: nil, name: nil}

    test "list_transaction_types/0 returns all transaction_types" do
      transaction_type = transaction_type_fixture()
      assert TransactionTypes.list_transaction_types() == [transaction_type]
    end

    test "get_transaction_type!/1 returns the transaction_type with given id" do
      transaction_type = transaction_type_fixture()
      assert TransactionTypes.get_transaction_type!(transaction_type.id) == transaction_type
    end

    test "create_transaction_type/1 with valid data creates a transaction_type" do
      valid_attrs = %{deleted_at: ~U[2024-04-18 02:36:00Z], description: "some description", name: "some name"}

      assert {:ok, %TransactionType{} = transaction_type} = TransactionTypes.create_transaction_type(valid_attrs)
      assert transaction_type.deleted_at == ~U[2024-04-18 02:36:00Z]
      assert transaction_type.description == "some description"
      assert transaction_type.name == "some name"
    end

    test "create_transaction_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TransactionTypes.create_transaction_type(@invalid_attrs)
    end

    test "update_transaction_type/2 with valid data updates the transaction_type" do
      transaction_type = transaction_type_fixture()
      update_attrs = %{deleted_at: ~U[2024-04-19 02:36:00Z], description: "some updated description", name: "some updated name"}

      assert {:ok, %TransactionType{} = transaction_type} = TransactionTypes.update_transaction_type(transaction_type, update_attrs)
      assert transaction_type.deleted_at == ~U[2024-04-19 02:36:00Z]
      assert transaction_type.description == "some updated description"
      assert transaction_type.name == "some updated name"
    end

    test "update_transaction_type/2 with invalid data returns error changeset" do
      transaction_type = transaction_type_fixture()
      assert {:error, %Ecto.Changeset{}} = TransactionTypes.update_transaction_type(transaction_type, @invalid_attrs)
      assert transaction_type == TransactionTypes.get_transaction_type!(transaction_type.id)
    end

    test "delete_transaction_type/1 deletes the transaction_type" do
      transaction_type = transaction_type_fixture()
      assert {:ok, %TransactionType{}} = TransactionTypes.delete_transaction_type(transaction_type)
      assert_raise Ecto.NoResultsError, fn -> TransactionTypes.get_transaction_type!(transaction_type.id) end
    end

    test "change_transaction_type/1 returns a transaction_type changeset" do
      transaction_type = transaction_type_fixture()
      assert %Ecto.Changeset{} = TransactionTypes.change_transaction_type(transaction_type)
    end
  end
end
