defmodule GrncHotel.Suppliers.Supplier do
  use Ecto.Schema
  import Ecto.Changeset

  schema "suppliers" do
    field :supplier_id, :string
    field :supplier_name, :string
    field :status, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(supplier, attrs) do
    supplier
    |> cast(attrs, [:supplier_id, :supplier_name, :status])
    |> validate_required([:supplier_id, :supplier_name, :status])
  end
end
