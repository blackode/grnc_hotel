# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GrncHotel.Repo.insert!(%GrncHotel.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

require Logger
alias GrncHotel.Repo
alias GrncHotel.Agents.Agent
alias GrncHotel.Suppliers.Supplier

# --- Suppliers ---------------------------------------------------

suppliers = [
  %{supplier_id: "SUPA", supplier_name: "Supplier A", status: true},
  %{supplier_id: "SUPB", supplier_name: "Supplier B", status: false},
  %{supplier_id: "SUPC", supplier_name: "Supplier C", status: true},
  %{supplier_id: "SUPD", supplier_name: "Supplier D", status: true},
  %{supplier_id: "SUPE", supplier_name: "Supplier E", status: false}
]

Enum.each(suppliers, &Repo.insert!(Supplier.changeset(%Supplier{}, &1)))

Logger.info("Suppliers Seeded!")

# --- Agents ------------------------------------------------------

agents = [
  %{
    agent_id: "AG001",
    name: "Agent One",
    suppliers: ["SUPA", "SUPB", "SUPC"]
  },
  %{
    agent_id: "AG002",
    name: "Agent Two",
    suppliers: ["SUPA", "SUPD"]
  },
  %{
    agent_id: "AG003",
    name: "Agent Three",
    suppliers: ["SUPC", "SUPE"]
  }
]

Enum.each(agents, &Repo.insert!(Agent.changeset(%Agent{}, &1)))

Logger.info("Agents Seeded!")

## Locations CityCodes
alias GrncHotel.Locations

IO.puts("Seeding City Codes...")

[
  %{city_code: "DEL", city_name: "Delhi"},
  %{city_code: "BOM", city_name: "Mumbai"},
  %{city_code: "MAA", city_name: "Chennai"},
  %{city_code: "BLR", city_name: "Bangalore"},
  %{city_code: "HYD", city_name: "Hyderabad"}
]
|> Enum.each(&Locations.create_city_code/1)

Logger.info("City Codes Seeded!")
