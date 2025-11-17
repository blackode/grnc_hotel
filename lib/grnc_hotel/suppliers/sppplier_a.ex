defmodule GrncHotel.Suppliers.SupplierA do
  alias GrncHotel.Suppliers.HotelData

  def fetch_hotels(city_code) do
    HotelData.hotels_for_city(city_code)
    |> Enum.map(fn h ->
      %{
        hotel_code: h.hotel_code,
        hotel: h.hotel,
        rates: [
          rate("Std"),
          rate("Deluxe"),
          rate("Suite")
        ]
      }
    end)
  end

  defp rate(room) do
    %{
      supplier: "SupplierA",
      price: :rand.uniform(200) + 150,
      room: room
    }
  end
end
