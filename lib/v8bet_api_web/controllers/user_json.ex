defmodule V8betApiWeb.UserJSON do
  alias V8betApi.Accounts.Account
  alias V8betApi.Users.User

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: user)}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: user}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      firstname: user.firstname,
      lastname: user.lastname,
      msisdn: user.msisdn,
      account: data(user.account)
    }
  end

  defp data(%Account{} = account) do
    %{
      id: account.id,
      email: account.email
    }
  end
end
