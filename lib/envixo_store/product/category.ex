defmodule EnvixoStore.Product.Category do
  use Ecto.Schema
  import Ecto.Changeset

  alias EnvixoStore.Product

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "categories" do
    field :title, :string

    belongs_to(:product, Product)

    timestamps()
  end

  @required_params [:title, :product_id]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> assoc_constraint(:product)
  end
end
