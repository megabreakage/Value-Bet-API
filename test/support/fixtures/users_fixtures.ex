defmodule V8betApi.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `V8betApi.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        firstname: "some firstname",
        lastname: "some lastname",
        msisdn: 42
      })
      |> V8betApi.Users.create_user()

    user
  end
end
