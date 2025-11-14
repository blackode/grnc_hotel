defmodule GrncHotel.Suppliers do
  alias GrncHotel.Repo
  alias GrncHotel.Suppliers.Supplier

  def list_suppliers do
    Repo.all(Supplier)
  end

  def create_supplier(attrs) do
    %Supplier{}
    |> Supplier.changeset(attrs)
    |> Repo.insert()
  end

  def update_supplier(supplier, attrs) do
    supplier
    |> Supplier.changeset(attrs)
    |> Repo.update()
  end
end
