defmodule BossTuples do
  @moduledoc """
  Solver for bo_tuple_counter
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
  def solution([]) do
    0
  end
  def solution([h | t]) do
    solution(h) + solution(t)
  end
  def solution(t) when is_tuple(t) do
    1 + solution(Tuple.to_list(t))
  end
  def solution(_) do
    0
  end
end
