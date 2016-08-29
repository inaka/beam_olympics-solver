defmodule EntangledServer do
  use GenServer

  def start() do
    {:ok, uppid} = GenServer.start(EntangledServer, :up)
    {:ok, downpid} = GenServer.start(EntangledServer, :down)
    :ok = GenServer.cast(uppid, downpid)
    :ok = GenServer.cast(downpid, uppid)
    {uppid, downpid}
  end

  # Callbacks
  def init(spin) do
    {:ok, %{spin: spin, pair: nil}}
  end

  def handle_call(:get_spin, _from, state) do
    {:reply, state.spin, state}
  end
  def handle_call(:invert_spin, from, state) do
    GenServer.call(state.pair, :just_invert_spin)
    handle_call(:just_invert_spin, from, state)
  end
  def handle_call(:just_invert_spin, _from, state = %{:spin => :up}) do
    {:reply, :ok, %{state | :spin => :down}}
  end
  def handle_call(:just_invert_spin, _from, state = %{:spin => :down}) do
    {:reply, :ok, %{state | :spin => :up}}
  end

  def handle_cast(pid, state) do
    {:noreply, %{state | :pair => pid}}
  end

end
