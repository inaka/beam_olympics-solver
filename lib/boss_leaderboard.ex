defmodule BossLeaderBoard do
  @moduledoc """
  Periodically Prints the Game LeaderBoard
  """
  use GenServer

  def start() do
    start(10000)
  end

  def start(refresh_ms) do
    GenServer.start(BossLeaderBoard, refresh_ms)
  end

  # Callbacks
  def init(refresh_ms) do
    print_board
    {:ok, refresh_ms, refresh_ms}
  end

  def handle_info(:timeout, refresh_ms) do
    print_board
    {:noreply, refresh_ms, refresh_ms}
  end

  def print_board() do
    %{:players => players, :tasks => tasks} = Boss.stats
    sorted = Enum.sort(players, fn(p1, p2) -> p1.score > p2.score end)
    IO.puts IO.ANSI.clear
    for player <- sorted do
      score = player.score |> Integer.to_string |> String.rjust(5, ?\s)
      IO.puts(
        "#{IO.ANSI.bright}#{score} #{IO.ANSI.normal} #{player.name} " <>
        "(#{IO.ANSI.yellow}#{player.done}/#{tasks}#{IO.ANSI.default_color}" <>
        " tasks)")
    end
  end

end
