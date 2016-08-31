defmodule BossStringy do
  @moduledoc """
  Solver for bo_stringy
  """

  @doc """
  Solves the task requirement
  """
  def solve do
    Boss.submit &solution/1
  end

  @doc """
  Solution for bo_stringy
  """
  def solution(string) do
    words = String.split(string, " ")
    Enum.join(capitalize(words), " ")
  end

  defp capitalize([]) do
    []
  end
  defp capitalize(["" | rest]) do
    ["" | capitalize(rest)]
  end
  defp capitalize([w]) do
    [String.capitalize(w)]
  end
  defp capitalize([w1, <<?(, _::binary>> = w2 | rest]) do
    [String.capitalize(w1), w2 | capitalize(rest)]
  end
  defp capitalize([<<n, _::binary>> = word | rest]) when n < ?A or n > ?z do
    [word | capitalize(rest)]
  end
  defp capitalize([w1, <<n, _::binary>> = w2 | rest]) when n < ?A or n > ?z do
    [cw1 | more] = capitalize([w1 | rest])
    [cw1, w2 | more]
  end
  defp capitalize([w1, w2 | rest]) do
    [String.capitalize(w1), w2 | capitalize(rest)]
  end
end
