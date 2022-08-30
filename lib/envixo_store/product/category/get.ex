defmodule EnvixoStore.Product.Category.Get do
  alias EnvixoStore.{Product, Repo}
  alias Product.Category
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> get_category(uuid)
    end
  end

  defp get_category(uuid) do
    Repo.get(Category, uuid)
  end
end
