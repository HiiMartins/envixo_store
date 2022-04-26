defmodule EnvixoStore.Product.Get do
  alias EnvixoStore.{Product, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> get_product(uuid)
    end
  end

  defp get_product(uuid) do
    Repo.get_by(Product, uuid)
  end
end
