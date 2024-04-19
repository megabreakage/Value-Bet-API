defmodule V8betApi.OddTypesTest do
  use V8betApi.DataCase

  alias V8betApi.OddTypes

  describe "odd_types" do
    alias V8betApi.OddTypes.OddType

    import V8betApi.OddTypesFixtures

    @invalid_attrs %{deleted_at: nil, name: nil}

    test "list_odd_types/0 returns all odd_types" do
      odd_type = odd_type_fixture()
      assert OddTypes.list_odd_types() == [odd_type]
    end

    test "get_odd_type!/1 returns the odd_type with given id" do
      odd_type = odd_type_fixture()
      assert OddTypes.get_odd_type!(odd_type.id) == odd_type
    end

    test "create_odd_type/1 with valid data creates a odd_type" do
      valid_attrs = %{deleted_at: ~U[2024-04-18 00:27:00Z], name: "some name"}

      assert {:ok, %OddType{} = odd_type} = OddTypes.create_odd_type(valid_attrs)
      assert odd_type.deleted_at == ~U[2024-04-18 00:27:00Z]
      assert odd_type.name == "some name"
    end

    test "create_odd_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OddTypes.create_odd_type(@invalid_attrs)
    end

    test "update_odd_type/2 with valid data updates the odd_type" do
      odd_type = odd_type_fixture()
      update_attrs = %{deleted_at: ~U[2024-04-19 00:27:00Z], name: "some updated name"}

      assert {:ok, %OddType{} = odd_type} = OddTypes.update_odd_type(odd_type, update_attrs)
      assert odd_type.deleted_at == ~U[2024-04-19 00:27:00Z]
      assert odd_type.name == "some updated name"
    end

    test "update_odd_type/2 with invalid data returns error changeset" do
      odd_type = odd_type_fixture()
      assert {:error, %Ecto.Changeset{}} = OddTypes.update_odd_type(odd_type, @invalid_attrs)
      assert odd_type == OddTypes.get_odd_type!(odd_type.id)
    end

    test "delete_odd_type/1 deletes the odd_type" do
      odd_type = odd_type_fixture()
      assert {:ok, %OddType{}} = OddTypes.delete_odd_type(odd_type)
      assert_raise Ecto.NoResultsError, fn -> OddTypes.get_odd_type!(odd_type.id) end
    end

    test "change_odd_type/1 returns a odd_type changeset" do
      odd_type = odd_type_fixture()
      assert %Ecto.Changeset{} = OddTypes.change_odd_type(odd_type)
    end
  end
end
