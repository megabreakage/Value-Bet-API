defmodule V8betApiWeb.OddJSON do
  alias V8betApi.Odds.Odd

  @doc """
  Renders a list of odds.
  """
  def index(%{odds: odds}) do
    %{data: for(odd <- odds, do: data(odd))}
  end

  @doc """
  Renders a single odd.
  """
  def show(%{odd: odd}) do
    %{data: data(odd)}
  end

  defp data(%Odd{} = odd) do
    %{
      id: odd.id,
      value: odd.value,
      deleted_at: odd.deleted_at
    }
  end
end
