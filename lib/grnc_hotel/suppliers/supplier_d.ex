defmodule GrncHotel.Suppliers.SupplierD do
  alias GrncHotel.Suppliers.HotelData

  def fetch_hotels(city_code) do
    HotelData.hotels_for_city(city_code)
    |> Enum.map(fn h ->
      %{
        hotel_code: h.hotel_code,
        hotel: h.hotel,
        rates: [
          rate("Economy"),
          rate("Business"),
          rate("Luxury")
        ]
      }
    end)
  end

  defp rate(room) do
    %{
      supplier: "SupplierD",
      price: :rand.uniform(350) + 90,
      room: room
    }
  end
end
