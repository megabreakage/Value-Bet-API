defmodule V8betApiWeb.OddTypeJSON do
  alias V8betApi.OddTypes.OddType

  @doc """
  Renders a list of odd_types.
  """
  def index(%{odd_types: odd_types}) do
    %{data: for(odd_type <- odd_types, do: data(odd_type))}
  end

  @doc """
  Renders a single odd_type.
  """
  def show(%{odd_type: odd_type}) do
    %{data: data(odd_type)}
  end

  defp data(%OddType{} = odd_type) do
    %{
      id: odd_type.id,
      name: odd_type.name
    }
  end
end
