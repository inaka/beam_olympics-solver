defmodule BossMissing do
  @moduledoc """
  Solver for bo_awesomeness
  """
  @doc """
  Solves the task requirement
  """
  def solve do
    Boss.submit &solution/2
  end

  @doc """
  Solution for bo_first_task
  """
  def solution(operands, result) do
    case do_solution(Enum.reverse(operands), result) do
      :notfound -> :notfound
      solution -> Enum.reverse(solution)
    end
  end

  def do_solution([operand], operand) do
    []
  end
  def do_solution([_], _result) do
    :notfound
  end
  def do_solution([operand | operands], result) do
    case do_solution(operands, result - operand) do
      :notfound ->
        case do_solution(operands, result + operand) do
          :notfound -> :notfound
          operators -> [:- | operators]
        end
      operators -> [:+  | operators]
    end
  end
end
