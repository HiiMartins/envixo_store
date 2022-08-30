defmodule EnvixoStore.ProductTest do
  use EnvixoStore.DataCase

  alias EnvixoStore.Product

  describe "build/1" do
    test "When all parrams are valid, return a tuple with :ok, valid struct" do
      params = %{
        title: "camiseta",
        description: "camiseta 100% algodão",
        status: true,
        price: 20.0
      }

      response = Product.build(params)

      assert {:ok,
              %Product{
                title: "camiseta",
                description: "camiseta 100% algodão",
                status: true,
                price: 20.0
              }} == response
    end
  end
end
