defmodule BossHenchmen do
  @moduledoc """
  Solver for bo_henchmen
  """
  @doc """
  Solves the task requirement
  """
  def solve do
    Boss.submit &solution/0
  end

  @doc """
  Solution for bo_first_task
  """
  def solution do
    spawn &loop/0
  end

  defp loop do
    this_node = node
    receive do
      p when is_pid(p) and node(p) == this_node ->
        Process.exit(p, :kill)
    end
    loop
  end
end
