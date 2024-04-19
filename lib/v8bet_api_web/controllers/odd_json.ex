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
      added_by: odd.added_by,
      updated_by: odd.updated_by,
    }
  end
end
