defmodule BossRomans do
  @moduledoc """
  Solver for bo_romans
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
  def solution(x) do
    validate(x)
    parse(x, 0)
  end

  def parse("", decimal) do
    decimal
  end
  def parse(<<?I, ?V>>, decimal) do
    decimal + 4
  end
  def parse(<<?I, ?V, rest :: binary>>, _) do
    throw {:invalid, rest}
  end
  def parse(<<?I, ?X>>, decimal) do
    decimal + 9
  end
  def parse(<<?I, ?X, rest :: binary>>, _) do
    throw {:invalid, rest}
  end
  def parse(<<?I, rest :: binary>>, decimal) do
    validate(rest, [?I])
    parse(rest, decimal + 1)
  end
  def parse(<<?V, rest :: binary>>, decimal) do
    validate(rest, [?I])
    parse(rest, decimal + 5)
  end
  def parse(<<?X, ?L, rest :: binary>>, decimal) do
    validate(rest, [?I, ?V, ?X])
    parse(rest, decimal + 40)
  end
  def parse(<<?X, ?C, rest :: binary>>, decimal) do
    validate(rest, [?I, ?V])
    parse(rest, decimal + 90)
  end
  def parse(<<?X, rest :: binary>>, decimal) do
    validate(rest, [?I, ?V, ?X])
    parse(rest, decimal + 10)
  end
  def parse(<<?L, rest :: binary>>, decimal) do
    validate(rest, [?I, ?V, ?X])
    parse(rest, decimal + 50)
  end
  def parse(<<?C, ?D, rest :: binary>>, decimal) do
    validate(rest, [?I, ?V, ?X, ?L, ?C])
    parse(rest, decimal + 400)
  end
  def parse(<<?C, ?M, rest :: binary>>, decimal) do
    validate(rest, [?I, ?V, ?X, ?L])
    parse(rest, decimal + 900)
  end
  def parse(<<?C, rest :: binary>>, decimal) do
    validate(rest, [?I, ?V, ?X, ?L, ?C])
    parse(rest, decimal + 100)
  end
  def parse(<<?D, rest :: binary>>, decimal) do
    validate(rest, [?I, ?V, ?X, ?L, ?C])
    parse(rest, decimal + 500)
  end
  def parse(<<?M, rest :: binary>>, decimal) do
    parse(rest, decimal + 1000)
  end

  def validate("", _) do
    :ok
  end
  def validate(<<c, rest :: binary>>, valid_chars) do
    case Enum.member?(valid_chars, c) do
      true -> validate(rest, valid_chars)
      false -> throw {:invalid, <<c, rest :: binary>>}
    end
  end

  def validate("") do
    throw {:invalid, ""}
  end
  def validate(x) do
    invalids = ["IIII", "VV", "XXXX", "LL", "CCCC", "DD", "MMMM",
                "XLX", "XCX", "CDC", "CMC"]
    case String.contains?(x, invalids) do
      true -> throw {:invalid, x}
      false -> :ok
    end
  end

end
