defmodule GrncHotel.SupplierEngine do
  @moduledoc false

  # 1:TODO: Implement enabled and disabled suppliers functions reading from suppliers table here

  import Ecto.Query, warn: false

  alias GrncHotel.Repo
  alias GrncHotel.Suppliers.Supplier

  def disabled_suppliers() do
    # TODO: Logic here using query to get disabled suppliers from DBConnection
    Repo.all_by(Supplier, status: false)
  end

  def enabled_suppliers() do
    # TODO: Logic here
    Repo.all_by(Supplier, status: true)
  end
end
