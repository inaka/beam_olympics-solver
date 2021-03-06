defmodule BossMissing do
  @moduledoc """
  Solver for bo_missing_operations
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
      op_list -> Enum.reverse(op_list)
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
