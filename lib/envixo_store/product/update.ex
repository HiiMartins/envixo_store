defmodule EnvixoStore.Product.Update do
  alias EnvixoStore.{Product, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, _uuid} -> update_product(params)
    end
  end

  defp update_product(%{"id" => uuid} = params) do
    case fetch_product(uuid) do
      nil -> {:error, "Product not found!"}
      product -> update_product(product, params)
    end
  end

  defp fetch_product(uuid), do: Repo.get(Product, uuid)

  defp update_product(product, params) do
    product
    |> Product.changeset(params)
    |> Repo.update()
  end
end
