defmodule EnvixoStore.Product.Delete do
  alias EnvixoStore.{Product, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> delete_product(uuid)
    end
  end

  defp delete_product(uuid) do
    case fetch_product(uuid) do
      nil -> {:error, "Product not found!"}
      product -> Repo.delete(product)
    end
  end

  defp fetch_product(uuid), do: Repo.get(Product, uuid)
end
