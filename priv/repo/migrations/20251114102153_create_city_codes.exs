defmodule GrncHotel.Repo.Migrations.CreateCityCodes do
  use Ecto.Migration

  def change do
    create table(:city_codes) do
      add :city_code, :string
      add :city_name, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:city_codes, [:city_code])
  end
end
