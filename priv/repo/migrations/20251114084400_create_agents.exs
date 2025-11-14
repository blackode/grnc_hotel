defmodule GrncHotel.Repo.Migrations.CreateAgents do
  use Ecto.Migration

  def change do
    create table(:agents) do
      add :agent_id, :string
      add :name, :string
      add :suppliers, {:array, :string}

      timestamps(type: :utc_datetime)
    end
  end
end
