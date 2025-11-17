defmodule GrncHotel.Suppliers.SupplierB do
  alias GrncHotel.Suppliers.HotelData

  def fetch_hotels(city_code) do
    HotelData.hotels_for_city(city_code)
    |> Enum.map(fn h ->
      %{
        hotel_code: h.hotel_code,
        hotel: h.hotel,
        rates: [
          rate("Std"),
          rate("King"),
          rate("Executive")
        ]
      }
    end)
  end

  defp rate(room) do
    %{
      supplier: "SupplierB",
      price: :rand.uniform(300) + 120,
      room: room
    }
  end
end
