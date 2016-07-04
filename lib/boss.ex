defmodule Boss do

  @typedoc """
  A function spec
  """
  @type spec :: %{
                  input: [String.t],
                  output: String.t
                 }

  @typedoc """
  A Task, as defined by beam_olympics
  """
  @type task :: %{
                  name: module,
                  desc: String.t,
                  spec: spec,
                  score: pos_integer
                 }

  @typedoc """
  Individual player statistics
  """
  @type player_stats :: %{
                           name: String.t,
                           done: non_neg_integer,
                           score: integer
                         }

  @typedoc """
  Game statistics
  """
  @type stats :: %{
                    tasks: pos_integer,
                    players: [player_stats]
                  }

  @doc """
  Signs up to the game. It uses node name as player name.
  """
  @spec signup() :: {:ok, task} | {:error, term}
  def signup do
    call {:signup, player}
  end

  @doc """
  Returns the current task
  """
  @spec task() :: {:ok, task} | {:error, term}
  def task do
    call {:task, player}
  end

  @doc """
  Submits a solution
  """
  @spec submit(term) ::
    {:ok, task} | :the_end | {:error, term} | {:failures, [term]}
  def submit(solution) do
    call {:submit, player, solution}
  end

  @doc """
  Skips a task
  """
  @spec skip() :: {:ok, task} | :the_end | {:error, term}
  def skip do
    call {:skip, player}
  end

  @doc """
  Returns the player score
  """
  @spec score() :: {:ok, integer} | {:error, term}
  def score do
    call {:score, player}
  end

  @doc """
  Returns the game stats
  """
  @spec stats() :: stats
  def stats do
    call :stats
  end

  defp call(msg) do
    node = Application.get_env(:boss, :server, 'olympics@127.0.0.1')
    GenServer.call({:bo_server, node}, msg, 60000)
  end

  defp player do
    [name|_] = String.split(Atom.to_string(node), "@")
    name
  end

end
