defmodule GrncHotel.Utils do
  alias GrncHotel.Agents

  def extract_data_from_agents() do
    data = Agents.list_agents()
    Enum.map(data, fn itm -> %{id: itm.agent_id, name: itm.name, suppliers: itm.suppliers} end)
  end
end
