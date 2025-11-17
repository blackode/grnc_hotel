defmodule GrncHotel.SupplierEngine do
  @moduledoc false

  # 1:TODO: Implement enabled and disabled suppliers functions reading from suppliers table here

  import Ecto.Query, warn: false

  def disabled_suppliers() do
    # TODO: Logic here using query to get disabled suppliers from DBConnection
  end

  def enabled_suppliers() do
    # TODO: Logic here
  end
end
