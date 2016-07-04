defmodule BossFirstTask do

  @doc """
  Solves the task requirement
  """
  def solve do
    Boss.submit &solution/1
  end

  @doc """
  Solution for bo_first_task
  """
  def solution(x) do
    x
  end

end
