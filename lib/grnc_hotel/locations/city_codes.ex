defmodule GrncHotel.Locations.CityCodes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "city_codes" do
    field :city_code, :string
    field :city_name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(city_codes, attrs) do
    city_codes
    |> cast(attrs, [:city_code, :city_name])
    |> validate_required([:city_code, :city_name])
    |> unique_constraint(:city_code)
  end
end
