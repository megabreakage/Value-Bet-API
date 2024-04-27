defmodule V8betApiWeb.AccountJSON do
  alias V8betApi.Users.User
  alias V8betApi.Accounts.Account

  @doc """
  Renders a list of accounts.
  """
  def index(%{accounts: accounts}) do
    %{data: for(account <- accounts, do: account)}
  end

  @doc """
  Renders a single account.
  """
  def show(%{account: account, token: token}) do
    %{data: data(account), token: token}
  end

  def show_account_user(%{account: account, user: user}) do
    %{data: account_user_data(account, user)}
  end

  def show_account_token(%{account: account, token: token}) do
    %{data: json_data(account, token)}
  end

  defp data(%Account{} = account) do
    %{
      id: account.id,
      email: account.email
    }
  end

  defp json_data(%Account{} = account, token) do
    %{
      id: account.id,
      email: account.email,
      token: token
    }
  end

  defp account_user_data(%Account{} = account, %User{} = user) do
    %{
      id: account.id,
      email: account.email,
      user: user
    }
  end
end
