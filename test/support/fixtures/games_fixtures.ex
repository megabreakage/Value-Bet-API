defmodule V8betApi.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `V8betApi.Games` context.
  """

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        active: true,
        deleted_at: ~U[2024-04-17 11:06:00Z],
        name: "some name"
      })
      |> V8betApi.Games.create_game()

    game
  end
end
