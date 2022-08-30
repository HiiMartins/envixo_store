defmodule EnvixoStore.Product.Category.Delete do
  alias EnvixoStore.{Product, Repo}
  alias Product.Category
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> delete_category(uuid)
    end
  end

  defp delete_category(uuid) do
    case Repo.get(Category, uuid) do
      nil -> {:error, "Category not foundd!"}
      category -> Repo.delete(category)
    end
  end
end
