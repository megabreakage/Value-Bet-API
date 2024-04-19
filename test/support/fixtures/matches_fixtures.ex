defmodule V8betApi.MatchesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `V8betApi.Matches` context.
  """

  @doc """
  Generate a match.
  """
  def match_fixture(attrs \\ %{}) do
    {:ok, match} =
      attrs
      |> Enum.into(%{
        deleted_at: ~U[2024-04-17 23:41:00Z],
        scheduled_at: ~U[2024-04-17 23:41:00Z]
      })
      |> V8betApi.Matches.create_match()

    match
  end
end
