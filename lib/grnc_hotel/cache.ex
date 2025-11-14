defmodule GrncHotel.Cache do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(_) do
    table = :ets.new(:search_cache, [:set, :public, :named_table])
    {:ok, table}
  end
end
