defmodule Testing do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_args) do
    schedule_work()
    {:ok, 0}
  end

  def handle_info(:work, state) do
    IO.puts("Holler! #{state + 1}")
    schedule_work()
    {:noreply, state + 1}
  end

  defp schedule_work do
    Process.send_after(self(), :work, 10000)
  end
end
