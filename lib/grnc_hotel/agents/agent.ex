defmodule GrncHotel.Agents.Agent do
  use Ecto.Schema
  import Ecto.Changeset

  schema "agents" do
    field :agent_id, :string
    field :name, :string
    field :suppliers, {:array, :string}

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(agent, attrs) do
    agent
    |> cast(attrs, [:agent_id, :name, :suppliers])
    |> validate_required([:agent_id, :name, :suppliers])
  end
end
