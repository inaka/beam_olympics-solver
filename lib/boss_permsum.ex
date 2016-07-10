defmodule BossPermSum do
  @moduledoc """
  Solver for bo_missing_operations
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
  def solution(number) do
    charlist = Integer.to_charlist(number)
    allperms = perms(charlist)
    uniqperms = Enum.uniq(allperms)
    allints = Enum.map(uniqperms, &List.to_integer/1)
    Enum.sum allints
  end

  def perms([]) do
    [[]]
  end
  def perms(list) do
    for h <- list, t <- perms(List.delete(list, h)), do: [h | t]
  end
end
