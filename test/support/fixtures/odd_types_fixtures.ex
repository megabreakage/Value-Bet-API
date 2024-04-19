defmodule V8betApi.OddTypesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `V8betApi.OddTypes` context.
  """

  @doc """
  Generate a odd_type.
  """
  def odd_type_fixture(attrs \\ %{}) do
    {:ok, odd_type} =
      attrs
      |> Enum.into(%{
        deleted_at: ~U[2024-04-18 00:27:00Z],
        name: "some name"
      })
      |> V8betApi.OddTypes.create_odd_type()

    odd_type
  end
end
