defmodule GrncHotel.Suppliers.HotelData do
  @moduledoc "Static hotel dataset for all supplier modules"

  @hotels %{
    "DEL" => [
      %{hotel_code: "TAJ123", hotel: "Taj Palace"},
      %{hotel_code: "ITC889", hotel: "ITC Maurya"}
    ],
    "BOM" => [
      %{hotel_code: "SEA001", hotel: "Sea Princess"},
      %{hotel_code: "TRI559", hotel: "Trident Nariman Point"}
    ],
    "BLR" => [
      %{hotel_code: "ORI900", hotel: "The Oberoi"},
      %{hotel_code: "LEM777", hotel: "Lemon Tree"}
    ],
    "HYD" => [
      %{hotel_code: "CHT111", hotel: "Charminar Residency"},
      %{hotel_code: "TIC444", hotel: "ITC Kohenur"}
    ],
    "MAA" => [
      %{hotel_code: "LEP333", hotel: "Leela Palace"},
      %{hotel_code: "HYA222", hotel: "Hyatt Regency"}
    ]
  }

  def hotels_for_city(city_code),
    do: Map.get(@hotels, city_code, [])
end
