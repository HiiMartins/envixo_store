defmodule EnvixoStore.Product.Create do
  alias EnvixoStore.{Product, Repo}

  def call(params) do
    params
    |> Product.build()
    |> create_product()
  end

  defp create_product({:ok, struct}), do: Repo.insert(struct)
  defp create_product({:error, _changeset} = error), do: error
end
