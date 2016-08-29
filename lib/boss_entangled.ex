defmodule BossEntangled do
  @moduledoc """
  Solver for bo_entangled
  """

  @doc """
  Solves the task requirement
  """
  def solve do
    Boss.submit &solution/0
  end

  @doc """
  Solution for bo_entangled
  """
  def solution() do
    EntangledServer.start
  end
end
