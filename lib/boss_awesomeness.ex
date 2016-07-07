defmodule BossAwesomeness do
  @moduledoc """
  Solver for bo_awesomeness
  """
  @doc """
  Solves the task requirement
  """
  def solve do
    Boss.submit &solution/1
  end

  @doc """
  Solution for bo_first_task
  """
  def solution(:chuck_norris) do
    11
  end
  def solution([]) do
    0
  end
  def solution(x) when is_list(x) do
    case Enum.member?(x, :chuck_norris) do
      true ->
        Enum.max(for i <- x, do: solution(i)) - 1
      false ->
        Enum.max(for i <- x, do: solution(i)) + 1
    end
  end
  def solution(x) when is_map(x) do
    [v | _] = Map.values(x)
    solution(v)
  end
  def solution(x) do
    10 - :erlang.size(:erlang.term_to_binary(x))
  end
end
