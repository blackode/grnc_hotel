defmodule GrncHotel.Repo do
  use Ecto.Repo,
    otp_app: :grnc_hotel,
    adapter: Ecto.Adapters.Postgres
end
