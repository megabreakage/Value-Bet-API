defmodule V8betApi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `V8betApi.Accounts` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        email: "some email",
        hash_password: "some hash_password"
      })
      |> V8betApi.Accounts.create_account()

    account
  end
end
