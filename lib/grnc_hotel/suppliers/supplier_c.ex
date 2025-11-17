defmodule GrncHotel.Suppliers.SupplierC do
  alias GrncHotel.Suppliers.HotelData

  def fetch_hotels(city_code) do
    HotelData.hotels_for_city(city_code)
    |> Enum.map(fn h ->
      %{
        hotel_code: h.hotel_code,
        hotel: h.hotel,
        rates: [
          rate("Suite"),
          rate("Premium")
        ]
      }
    end)
  end

  defp rate(room) do
    %{
      supplier: "SupplierC",
      price: :rand.uniform(250) + 100,
      room: room
    }
  end
end
