defmodule EnvixoStore.Product.Category do
  use Ecto.Schema
  import Ecto.Changeset

  alias EnvixoStore.Product

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "categories" do
    field :title, :string
    has_many(:product, Product)

    timestamps()
  end

  @required_params [:title]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  defp changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint(:title)
  end
end
