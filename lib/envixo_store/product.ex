defmodule EnvixoStore.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias EnvixoStore.Product.Category

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "products" do
    field :title, :string
    field :description, :string
    field :status, :boolean, default: false
    field :price, :float
    field :promotion_price, :float

    belongs_to(:category, Category)

    timestamps()
  end

  @required_params [:title, :description, :status, :price, :category_id]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(product, params), do: create_changeset(product, params)

  defp create_changeset(module_or_product, params) do
    module_or_product
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
