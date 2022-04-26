defmodule EnvixoStore.Product.GetAll do
  alias EnvixoStore.{Product, Repo}

  def call() do
    Product
    |> list_all_products()
  end

  defp list_all_products(struct) do
    struct
    |> Repo.all()
  end
end
