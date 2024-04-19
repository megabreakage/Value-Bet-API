defmodule V8betApi.OddsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `V8betApi.Odds` context.
  """

  @doc """
  Generate a odd.
  """
  def odd_fixture(attrs \\ %{}) do
    {:ok, odd} =
      attrs
      |> Enum.into(%{
        deleted_at: ~U[2024-04-18 00:39:00Z],
        value: 120.5
      })
      |> V8betApi.Odds.create_odd()

    odd
  end
end
