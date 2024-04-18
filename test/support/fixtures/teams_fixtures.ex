defmodule V8betApi.TeamsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `V8betApi.Teams` context.
  """

  @doc """
  Generate a team.
  """
  def team_fixture(attrs \\ %{}) do
    {:ok, team} =
      attrs
      |> Enum.into(%{
        active: true,
        biography: "some biography",
        deleted_at: ~U[2024-04-17 11:22:00Z],
        name: "some name"
      })
      |> V8betApi.Teams.create_team()

    team
  end
end
