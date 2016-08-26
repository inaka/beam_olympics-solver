defmodule BossOldSchool do
  @moduledoc """
  Solver for bo_oldschool_flags
  """

  @doc """
  Solves the task requirement
  """
  def solve do
    Boss.submit &solution/2
  end

  @doc """
  Solution for bo_oldschool_flags
  """
  def solution(bools, size) do
    bits = for b <- bools, into: <<>>, do: parse(b)
    pad(bits, size)
  end

  def pad(bits, :char) do pad(bits, 8) end
  def pad(bits, :short) do pad(bits, 16) end
  def pad(bits, :int) do pad(bits, 32) end
  def pad(bits, size) do
    padding = size - bit_size(bits)
    << 0 :: size(padding), bits :: bitstring >>
  end

  def parse(:true) do <<1 :: size(1)>> end
  def parse(:false) do <<0 :: size(1)>> end
end
