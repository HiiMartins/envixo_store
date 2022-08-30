defmodule EnvixoStore.Product.Category.Create do
  alias EnvixoStore.Product.Category
  alias EnvixoStore.Repo

  def call(params) do
    params
    |> Category.build()
    |> create_category()
  end

  defp create_category({:ok, struct}), do: Repo.insert(struct)
  defp create_category({:error, _changeset} = error), do: error
end
