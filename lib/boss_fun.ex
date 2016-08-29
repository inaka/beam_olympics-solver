defmodule BossFun do
  @moduledoc """
  Solver for bo_fun_with_numbers
  """

  @doc """
  Solves the task requirement
  """
  def solve do
    Boss.submit &solution/1
  end

  @doc """
  Solution for bo_fun_with_numbers
  """
  def solution(string) when is_binary(string) do
    solution(String.to_charlist(string))
  end
  def solution([]) do
    []
  end
  def solution(charlist) do
    case :string.to_float(charlist) do
      {:error, :no_float} ->
        case :string.to_integer(charlist) do
          {:error, :no_integer} ->
            [_| tail] = charlist
            solution(tail)
          {number, tail} ->
            [number | solution(tail)]
        end
      {number, tail} ->
        [number | solution(tail)]
    end
  end
end
