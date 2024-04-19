defmodule V8betApi.BetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `V8betApi.Bets` context.
  """

  @doc """
  Generate a bet.
  """
  def bet_fixture(attrs \\ %{}) do
    {:ok, bet} =
      attrs
      |> Enum.into(%{
        amount: 120.5,
        expires_at: ~U[2024-04-18 01:42:00Z],
        start_time: ~U[2024-04-18 01:42:00Z]
      })
      |> V8betApi.Bets.create_bet()

    bet
  end
end
