defmodule V8betApi.BetStatusesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `V8betApi.BetStatuses` context.
  """

  @doc """
  Generate a bet_status.
  """
  def bet_status_fixture(attrs \\ %{}) do
    {:ok, bet_status} =
      attrs
      |> Enum.into(%{
        deleted_at: ~U[2024-04-18 01:23:00Z],
        name: "some name"
      })
      |> V8betApi.BetStatuses.create_bet_status()

    bet_status
  end
end
