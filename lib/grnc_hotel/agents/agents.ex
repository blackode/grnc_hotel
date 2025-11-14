defmodule GrncHotel.Agents do
  import Ecto.Query
  alias GrncHotel.Repo
  alias GrncHotel.Agents.Agent

  def list_agents do
    Repo.all(Agent)
  end

  def get_agent_by_id(agent_id) do
    Repo.get_by(Agent, agent_id: agent_id)
  end

  def create_agent(attrs) do
    %Agent{}
    |> Agent.changeset(attrs)
    |> Repo.insert()
  end

  def update_agent(agent, attrs) do
    agent
    |> Agent.changeset(attrs)
    |> Repo.update()
  end
end
