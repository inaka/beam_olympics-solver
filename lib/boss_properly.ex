defmodule BossProperly do
  @moduledoc """
  Solver for bo_properly
  """

  @doc """
  Solves the task requirement
  """
  def solve do
    Boss.submit &solution/1
  end

  @doc """
  Solution for bo_properly
  """
  def solution([]) do
    []
  end
  def solution([h | t]) when is_list(h) and is_list(t) do
    [solution(h) | solution(t)]
  end
  def solution([h | t]) when is_list(t) do
    [h | solution(t)]
  end
  def solution([h | t]) when is_list(h) do
    [solution(h), t]
  end
  def solution([h | t]) do
    [h, t]
  end
end
