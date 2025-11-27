defmodule GrncHotelWeb.HotelController do
  use GrncHotelWeb, :controller

  alias GrncHotel.Agents
  alias GrncHotel.SupplierEngine
  require Logger

  def fetch_hotels(conn, %{"agent_id" => agent_id, "city_code" => city_code}) do
    case Agents.get_agent_by_id(agent_id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{status: "error", message: "Agent not found"})

      agent ->
        Logger.info("Agent found: #{agent.name}, Suppliers: #{inspect(agent.suppliers)}")
        hotels = aggregate_hotels(agent.suppliers, city_code)
        Logger.info("Total hotels fetched: #{length(hotels)}")

        conn
        |> put_status(:ok)
        |> json(%{status: "success", hotels: hotels})
    end
  end

  def fetch_hotels(conn, _params) do
    conn
    |> put_status(:bad_request)
    |> json(%{status: "error", message: "Missing required parameters: agent_id and city_code"})
  end

  defp aggregate_hotels(supplier_ids, city_code) do
    enabled_suppliers = SupplierEngine.enabled_suppliers()

    Logger.info("All enabled suppliers: #{inspect(enabled_suppliers)}")

    enabled_supplier_map =
      enabled_suppliers
      |> Enum.filter(fn s -> s.supplier_id in supplier_ids end)
      |> Map.new(fn s -> {s.supplier_id, s.supplier_name} end)

    Logger.info("Suppliers to query (after filtering): #{inspect(enabled_supplier_map)}")

    enabled_supplier_map
    |> Task.async_stream(
      fn {supplier_id, supplier_name} ->
        Logger.info("Fetching from #{supplier_id} (#{supplier_name}) for city #{city_code}")
        fetch_from_supplier(supplier_id, supplier_name, city_code)
      end,
      timeout: 10_000,
      on_timeout: :kill_task,
      max_concurrency: 10
    )
    |> Enum.flat_map(fn
      {:ok, {:ok, hotels}} ->
        Logger.info("Successfully fetched #{length(hotels)} hotels")
        hotels

      {:ok, {:error, reason}} ->
        Logger.error("Error fetching hotels: #{reason}")
        []

      {:exit, reason} ->
        Logger.error("Task exited: #{inspect(reason)}")
        []
    end)
    |> merge_hotels()
  end

  defp fetch_from_supplier(supplier_id, supplier_name, city_code) do
    try do
      module_name = String.replace(supplier_name, " ", "")
      module = String.to_existing_atom("Elixir.GrncHotel.Suppliers.#{module_name}")
      hotels = apply(module, :fetch_hotels, [city_code])
      {:ok, hotels}
    rescue
      ArgumentError ->
        {:error, "Supplier module #{supplier_name} not found for #{supplier_id}"}

      error ->
        {:error, "Error fetching from #{supplier_id} (#{supplier_name}): #{inspect(error)}"}
    end
  end

  defp merge_hotels(hotels) do
    hotels
    |> Enum.group_by(& &1.hotel_code)
    |> Enum.map(fn {_hotel_code, hotel_list} ->
      base_hotel = List.first(hotel_list)
      all_rates = Enum.flat_map(hotel_list, & &1.rates)

      %{
        hotel_code: base_hotel.hotel_code,
        hotel: base_hotel.hotel,
        rates: all_rates
      }
    end)
  end
end
