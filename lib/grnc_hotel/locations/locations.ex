defmodule GrncHotel.Locations do
  alias GrncHotel.Repo
  alias GrncHotel.Locations.CityCodes

  def list_city_codes do
    Repo.all(CityCodes)
  end

  def create_city_code(attrs \\ %{}) do
    %CityCodes{}
    |> CityCodes.changeset(attrs)
    |> Repo.insert()
  end
end
