defmodule EnvixoStore do
  alias EnvixoStore.Product

  defdelegate create_product(params), to: Product.Create, as: :call
  defdelegate delete_product(params), to: Product.Delete, as: :call
  defdelegate fetch_product(params), to: Product.Get, as: :call
  defdelegate list_all_products, to: Product.GetAll, as: :call
  defdelegate update_product(params), to: Product.Update, as: :call
end
